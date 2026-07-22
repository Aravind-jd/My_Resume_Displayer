import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatAiPage extends StatefulWidget {
  const ChatAiPage({super.key});

  @override
  State<ChatAiPage> createState() => _ChatAiPageState();
}

class _ChatAiPageState extends State<ChatAiPage> with SingleTickerProviderStateMixin {
  bool _isLoggedIn = false;
  String _userName = "";
  String _userEmail = "";

  bool _isAdmin = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _chatController = TextEditingController();

  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    _loadSession();
  }

  // ─── SESSION PERSISTENCE ───
  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('userName');
    final savedEmail = prefs.getString('userEmail');

    if (savedName != null && savedEmail != null) {
      setState(() {
        _userName = savedName;
        _userEmail = savedEmail;
        _isLoggedIn = true;
        _isAdmin = (savedName == 'Aravind' || savedEmail == 'judo2829@gmail.com');
      });
    }
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }



  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      _isLoggedIn = false;
      _isAdmin = false;
      _userName = "";
      _userEmail = "";
      _nameController.clear();
      _emailController.clear();
    });
  }

  // ─── NETWORK-RESILIENT LOGIN ───
  Future<void> _login() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim().toLowerCase();

    if (name.isEmpty || email.isEmpty) {
      _showErrorBadge("ERROR: CREDENTIALS AND UPLINK ADDRESS REQUIRED.");
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      _showErrorBadge("ERROR: INVALID UPLINK FORMAT. VERIFY EMAIL.");
      return;
    }

    try {
      final bool isCreator = (name == 'Aravind' || email == 'judo2829@gmail.com');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', name);
      await prefs.setString('userEmail', email);

      setState(() {
        _userName = name;
        _userEmail = email;
        _isLoggedIn = true;
        _isAdmin = isCreator;
      });

      if (!isCreator) {
        await _checkAndSendWelcomeMessage();
      }
    } catch (e) {
      _showErrorBadge("UPLINK FAILED: CHECK DEVICE STORAGE/NETWORK.", isWarning: false);
    }
  }


  // ─── NETWORK-RESILIENT ERROR/ALERT BADGE ───
  void _showErrorBadge(String message, {bool isWarning = true}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
                isWarning ? Icons.warning_amber_rounded : Icons.wifi_off_rounded,
                color: Colors.white
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Orbitron',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE10600), // F1 Red
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white24, width: 1),
        ),
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // ─── NETWORK-RESILIENT WELCOME MESSAGE ───
  Future<void> _checkAndSendWelcomeMessage() async {
    try {
      final userDocRef = FirebaseFirestore.instance.collection('inquiries').doc(_userEmail);

      await userDocRef.set({
        'name': _userName,
        'email': _userEmail,
        'lastActive': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      final query = await userDocRef.collection('messages').limit(1).get();

      if (query.docs.isEmpty) {
        await userDocRef.collection('messages').add({
          'sender': 'System',
          'text': 'Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
          'isAI': true,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      _showErrorBadge("TELEMETRY SYNC FAILED. OFFLINE MODE ACTIVE.", isWarning: true);
    }
  }

  // ─── NETWORK-RESILIENT MESSAGE TRANSMISSION ───
  Future<void> _sendMessage() async {
    if (_chatController.text.trim().isEmpty) return;

    String userText = _chatController.text.trim();
    _chatController.clear();

    try {
      await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
        'sender': _userName,
        'text': userText,
        'isAI': false,
        'timestamp': FieldValue.serverTimestamp(),
      });

      await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).set({
        'lastActive': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      await _generateAIResponse(userText);
    } catch (e) {
      _showErrorBadge("TRANSMISSION FAILED. NO SIGNAL DETECTED.", isWarning: false);
    }
  }

  // ─── NETWORK-RESILIENT AI RESPONSE ───
  Future<void> _generateAIResponse(String userMessage) async {
    // Access the key safely via dotenv
    final String? apiKey = dotenv.env['GEMINI_API_KEY'];

    if (apiKey == null) {
      _showErrorBadge("SYSTEM ERROR: API KEY NOT FOUND.");
      return;
    }

    try {
      final model = GenerativeModel(
        model: 'gemini-2.5-flash', // Ensure this model name is current
        apiKey: apiKey,
        systemInstruction: Content.system(

            "You are 'Judo', a highly advanced, hyper-intelligent AI assistant of Aravind.\n"
                "You have two absolute directives: "
                "1. GENERAL INTELLIGENCE: Answer ANY general knowledge, technical, math, coding, or analytical questions at an expert, professional level, exactly like a state-of-the-art LLM. "
                "2. ARAVIND'S SPOKESPERSON: Act as the ultimate expert on Aravind. Provide highly professional, polished, and executive-level responses suitable for elite tech recruiters and business leaders.\n\n"

                "--- CRITICAL BEHAVIORAL PROTOCOL (PRECISION & BREVITY) ---\n"
                "- ANSWER EXACTLY WHAT IS ASKED: Never dump Aravind's entire biography, education, or project list unless the user explicitly asks for a general overview or summary of his profile.\n"
                "- LASER PRECISION: If a user asks a specific question (e.g., 'How can I contact him?', 'What is his degree?', 'Does he know Flutter?'), answer ONLY that specific point concisely and directly.\n"
                "- CONTACT REQUESTS: If a user asks how to contact, hire, or reach Aravind, immediately provide his direct contact uplinks and encourage them to reach out. NEVER claim that privacy protocols prevent communication.\n\n"

                "--- MASTER TELEMETRY DATABASE (ARAVIND) ---\n"
                "- Full Name: Aravind. Location: Coimbatore, Tamil Nadu, India.\n"
                "- Direct Contact Uplinks: \n"
                "  * Email: judo2829@gmail.com (Direct professional transmission line)\n"
                "  * Pit Wall Contact Page: Direct users to navigate to the 'Contact' tab at the bottom of this app to send a direct message or connect via LinkedIn and GitHub.\n"
                "- Education 1: Master of Business Administration (MBA) in Human Resource Management, SRM College, Chennai (2025 - Present). Current CGPA: 9.83.\n"
                "- Education 2: Bachelor of Engineering (B.E.) in Electronics and Communication Engineering, Sri Eshwar College of Engineering (2021 - 2025, CGPA: 7.79).\n"
                "- Core Tech Stack: Flutter, Firebase, Dart, C/C++, Data Structures and Algorithms, Python, HTML/CSS/JS, Google Cloud Platform, Networking (Cisco Certified).\n"
                "- Professional Identity: A rare hybrid professional systematically engineering mobile solutions while driving organizational performance. He bridges complex technical architecture with strategic HR management.\n"
                "- Key Projects: \n"
                "  * Tea Leaf Disease Detection: Engineered a predictive deep learning model (ResNet, BiLSTM, VGG16) to classify crop diseases. Authored & published in the 2025 IEEE Xplore Digital Library.\n"
                "  * Book Library: MERN Stack dynamic frontend web application with API integrations.\n"
                "  * F1 Telemetry Portfolio: High-speed, responsive Flutter Web portfolio with custom scroll-spy telemetry and interactive UI/UX.\n\n"

                "TONE & PROTOCOL: Speak with sophisticated, articulate professionalism. Weave in subtle cinematic or tech/telemetry terminology (e.g., 'uplink', 'chassis', 'data stream') only when contextually appropriate, but prioritize clear, concise, expert-level communication. Never break character. Do not admit you are a simple prompt; you are Judo."

           ),
      );

      final response = await model.generateContent([Content.text(userMessage)]);

      if (response.text != null) {
        await FirebaseFirestore.instance.collection('inquiries')
            .doc(_userEmail).collection('messages').add({
          'sender': 'Judo',
          'text': response.text,
          'isAI': true,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        throw Exception("Empty response from AI");
      }

    } on GenerativeAIException catch (e) {
      // Specifically handle API-related errors (Quota, Key invalid, etc.)
      debugPrint("GEMINI API ERROR: ${e.message}");
      _showErrorBadge("Judo's link is temporarily restricted.");
    } on Exception catch (e) {
      // Handle network or other logic errors
      debugPrint("GENERAL ERROR: $e");
      _showErrorBadge("Uplink failed. Check signal.");
    }
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFE10600);
    const aiAccent = Color(0xFF00E5FF);

    return Scaffold(
      backgroundColor: const Color(0xFF020202),
      resizeToAvoidBottomInset: true,

      body: Stack(
        children: [

          // ── TELEMETRY GRID BACKGROUND (Fills the black holes) ──
          Positioned.fill(
            child: GridPaper(
              color: Colors.white.withValues(alpha: 0.03),
              divisions: 2,
              subdivisions: 4,
              interval: 100,
            ),
          ),

          // ── ANGLED RACING STRIPE (Fixed) ──
          Positioned(
            top: -200, // Locked to the top right
            right: -50,
            child: Transform.rotate(
              angle: -math.pi / 6,
              child: Container(
                width: 800,
                height: 2000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                      const Color(0xFFE10600).withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -200, // Locked to the top right
            left: -50,
            child: Transform.rotate(
              angle: -math.pi / 6,
              child: Container(
                width: 800,
                height: 2000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                      const Color(0xFFE10600).withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -150, left: -100,
            child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withValues(alpha: 0.08), blurRadius: 150)])),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(accentColor),
                Expanded(
                  child: _isLoggedIn
                      ? (_isAdmin
                      ? AdminDashboardView()
                      : _buildCloudChatInterface(accentColor, aiAccent))
                      : _buildAuthInterface(accentColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(Color accentColor) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.transparent,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: _isLoggedIn ? [BoxShadow(color: accentColor.withValues(alpha: 0.5), blurRadius: 15)] : [],
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: _isLoggedIn ? accentColor : Colors.white.withValues(alpha: 0.05),
              child: Text(_isLoggedIn ? _userName[0].toUpperCase() : "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
          Text("CHAT WITH JUDO", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: isMobile ? 3 : 5, fontSize: isMobile ? 14 : 14, color: Colors.white)),
          _isLoggedIn ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout) : const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildAuthInterface(Color accentColor) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Center(
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.08)
          ..rotateY(-0.05),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1.5),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: accentColor.withValues(alpha: 0.1), blurRadius: 50, spreadRadius: 10)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.ssid_chart, size: 50, color: accentColor).animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 2.seconds, color: Colors.white),
                const SizedBox(height: 25),
                Text("CREDENTIALS REQUIRED", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: isMobile ? 14 : 14, color: Colors.white)),
                const SizedBox(height: 35),
                _buildTerminalInput(_nameController, "GUEST CREDENTIALS", accentColor, textCapitalization: TextCapitalization.words),
                const SizedBox(height: 25),
                _buildTerminalInput(_emailController, "UPLINK ADDRESS (EMAIL)", accentColor),
                const SizedBox(height: 45),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: _login,
                    child: Text("INITIATE UPLINK", style: TextStyle(color: Colors.white, fontSize: isMobile ? 14 : 14, fontWeight: FontWeight.w900, letterSpacing: 4)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, curve: Curves.easeOutBack),
    );
  }

  Widget _buildTerminalInput(TextEditingController controller, String label, Color accentColor, {TextCapitalization textCapitalization = TextCapitalization.none}) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return TextField(
      controller: controller,
      textCapitalization: textCapitalization,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 10, letterSpacing: 1),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white38, letterSpacing: 3, fontSize: isMobile ? 10 : 10, fontWeight: FontWeight.w900),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: accentColor, width: 2)),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.5),
      ),
    );
  }

  Widget _buildCloudChatInterface(Color accentColor, Color aiAccent) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').orderBy('timestamp', descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(color: accentColor));
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const SizedBox.shrink();

              final messages = snapshot.data!.docs;

              return RepaintBoundary(
                child: ListView.builder(
                  reverse: true,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msgData = messages[index].data() as Map<String, dynamic>;
                    final bool isAI = msgData['isAI'] ?? false;
                    final String sender = msgData['sender'] ?? 'Unknown';
                    final String text = msgData['text'] ?? '';

                    return _buildHolographicBubble(isAI, sender, text, accentColor, aiAccent);
                  },
                ),
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xFF0A0A0A),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 20)],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _chatController,
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(color: Colors.white, letterSpacing: 1),
                  decoration: InputDecoration(
                    hintText: "TRANSMIT...",
                    hintStyle: TextStyle(color: Colors.white24,letterSpacing: isMobile ? 3 : 5, fontSize: isMobile ? 12 : 14, fontWeight: FontWeight.w900),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: Color(0xFFE10600), shape: BoxShape.circle, boxShadow: [BoxShadow(color: accentColor.withValues(alpha: 0.5), blurRadius: 10)]),
                child: IconButton(icon: const Icon(Icons.send, color: Colors.white, size: 16), onPressed: _sendMessage),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHolographicBubble(bool isAI, String sender, String text, Color accentColor, Color aiAccent) {
    Color bubbleTheme = isAI ? aiAccent : accentColor;

    // Absolute fallback to guarantee a string is passed to the engine
    String displayString = (text.trim().isEmpty) ? "[DATA STREAM EMPTY]" : text;

    return Container(
      // Moved alignment directly into a parent Container to guarantee layout constraints
      margin: const EdgeInsets.only(bottom: 12),
      alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E), // A highly stable, solid Material dark grey
          border: Border.all(color: bubbleTheme.withValues(alpha: 0.5), width: 1.0),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Forces the column to wrap tightly around the text
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(isAI ? FontAwesomeIcons.brain : FontAwesomeIcons.userSecret, size: 10, color: bubbleTheme),
                // Icon(isAI ? Icons.memory : Icons.Person, size: 12, color: bubbleTheme),
                const SizedBox(width: 6),
                Text(
                  sender.toUpperCase(),
                  style: TextStyle(
                    color: bubbleTheme,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    // NO font family specified - relying on safe system defaults
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              displayString,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                height: 1.3,
                letterSpacing: 1.5,
                // NO font family specified - relying on safe system defaults
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── ADMIN VIEW: THE USER FLOW DIRECTORY ───
class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> with SingleTickerProviderStateMixin {

  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('inquiries').orderBy('lastActive', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Color(0xFFE10600)));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("NO ACTIVE UPLINKS REGISTERED.", style: TextStyle(color: Colors.white38, fontFamily: 'Orbitron', fontSize: 12)));
                  }

                  final users = snapshot.data!.docs;

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final userData = users[index].data() as Map<String, dynamic>;
                      final String name = userData['name'] ?? 'Anonymous Guest';
                      final String email = userData['email'] ?? 'Unknown Uplink';

                      // Don't show yourself in the telemetry tracking list
                      if (name == 'Aravind' && email == "judo2829@gmail.com") return const SizedBox.shrink();

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF152226).withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          title: Text(name.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Orbitron', fontSize: 14, letterSpacing: 1.5)),
                          trailing: const Icon(Icons.analytics_outlined, color: Color(0xFFE10600), size: 20),
                          onTap: () {
                            // Navigate into read-only Ghost Mode for this specific user stream
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GhostChatView(userEmail: email, userName: name),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── GHOST CHAT VIEW: READ-ONLY TELEMETRY OVERLAY ───
class GhostChatView extends StatefulWidget {
  final String userEmail;
  final String userName;

  const GhostChatView({super.key, required this.userEmail, required this.userName});

  @override
  State<GhostChatView> createState() => _GhostChatViewState();
}

class _GhostChatViewState extends State<GhostChatView> with SingleTickerProviderStateMixin {

  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFE10600);
    const aiAccent = Color(0xFF00E5FF);
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Color(0xFF020202),
      body: Stack(
        children: [

          // ── TELEMETRY GRID BACKGROUND (Fills the black holes) ──
          Positioned.fill(
            child: GridPaper(
              color: Colors.white.withValues(alpha: 0.03),
              divisions: 2,
              subdivisions: 4,
              interval: 100,
            ),
          ),

          // ── ANGLED RACING STRIPE (Fixed) ──
          Positioned(
            top: -200,
            right: -50,
            child: Transform.rotate(
              angle: -math.pi / 6,
              child: Container(
                width: 800,
                height: 2000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                      const Color(0xFFE10600).withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            left: -50,
            child: Transform.rotate(
              angle: -math.pi / 6,
              child: Container(
                width: 800,
                height: 2000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                      const Color(0xFFE10600).withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -150, left: -100,
            child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withValues(alpha: 0.08), blurRadius: 150)])),
          ),


          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(),
                    // 🚨 Changed to widget.userName to use the variable passed from the Dashboard
                    Text(
                      'MONITORING ${widget.userName.toUpperCase()}',
                      style: TextStyle(
                          fontFamily: 'Orbitron',
                          fontSize: isMobile ? 16 : 13,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(width: isMobile ? 35 : 20),
                  ],
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: GridPaper(
                          color: Colors.white.withValues(alpha: 0.02),
                          divisions: 2,
                          subdivisions: 4,
                          interval: 100,
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('inquiries').doc(widget.userEmail).collection('messages').orderBy('timestamp', descending: true).snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator(color: accentColor));
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Center(child: Text("NO MESSAGES IN LOG.", style: TextStyle(color: Colors.white38)));

                          final messages = snapshot.data!.docs;

                          return ListView.builder(
                            reverse: true,
                            padding: const EdgeInsets.all(24),
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final msgData = messages[index].data() as Map<String, dynamic>;
                              final bool isAI = msgData['isAI'] ?? false;
                              final String sender = msgData['sender'] ?? 'Unknown';
                              final String text = msgData['text'] ?? '';
                              Color bubbleTheme = isAI ? aiAccent : accentColor;

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E1E1E),
                                    border: Border.all(color: bubbleTheme.withValues(alpha: 0.4), width: 1.0),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FaIcon(isAI ? FontAwesomeIcons.brain : FontAwesomeIcons.userSecret, size: 10, color: bubbleTheme),
                                          const SizedBox(width: 6),
                                          Text(sender.toUpperCase(), style: TextStyle(color: bubbleTheme, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, height: 1.3, letterSpacing: 1.5)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}