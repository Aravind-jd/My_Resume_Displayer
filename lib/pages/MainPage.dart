import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

import '../widgets/blinking_live_badge.dart';
import '../widgets/fade_in_up.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key, required this.isActive, required this.onContactTapped,});
  final bool isActive;
  final VoidCallback onContactTapped;

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> with SingleTickerProviderStateMixin {

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  bool _isFront = true;
  bool _isHovered = false;

  // Feature Upgrade: Telemetry Export State
  bool _isExporting = false;

  final List<String> _menuItems = ["About", "Career", "Projects", "Tech Stacks", "Certificates","Contact"];
  int _selectedMenuIndex = 0;

  String _liveAge = "00Y : 00M : 00W : 00D : 00Hr";

  @override
  void initState() {
    super.initState();
    // Setup the 3D flip animation
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Smooth, heavy rotation
    );

    _flipAnimation = Tween<double>(begin: 0, end: math.pi).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOutBack),
    );

    _calculateLiveAge();
  }

  @override
  void didUpdateWidget(Mainpage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive && !widget.isActive) {
      if (!_isFront) {
        _flipController.value = 0.0;
        setState(() {
          _isFront = true;
          _selectedMenuIndex = 0;
        });
      }
    }
  }

  void _calculateLiveAge() {
    final birthDate = DateTime(2003, 10, 28);
    final now = DateTime.now();

    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    if (months < 0 || (months == 0 && now.day < birthDate.day)) {
      years--;
      months += 12;
    }

    int lastMonth = now.day < birthDate.day ? now.month - 1 : now.month;
    int yearOfLastMonth = now.year;
    if (lastMonth == 0) {
      lastMonth = 12;
      yearOfLastMonth--;
    }

    final lastMonthDate = DateTime(yearOfLastMonth, lastMonth, birthDate.day);
    int totalDays = now.difference(lastMonthDate).inDays;

    int weeks = totalDays ~/ 7;
    int days = totalDays % 7;

    final durationSinceLastMonth = now.difference(lastMonthDate);
    int hours = durationSinceLastMonth.inHours % 24; // Extracts the leftover hours!

    if (mounted) {
      setState(() {
        _liveAge = "${years.toString().padLeft(2, '0')}Y : "
            "${months.toString().padLeft(2, '0')}M : "
            "${weeks.toString().padLeft(2, '0')}W : "
            "${days.toString().padLeft(2, '0')}D : "
            "${hours.toString().padLeft(2, '0')}Hr";
      });
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _toggleFlip() {
    setState(() {
      if (_isFront) {
        _flipController.forward();
      } else {
        _flipController.reverse();
        _selectedMenuIndex = 0;
      }
      _isFront = !_isFront;
    });
  }


  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: _isFront,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if(!_isFront) {
          _toggleFlip();
        }
        print("Pop result: $result");
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE10600),
        body: Center(
          child: GestureDetector(
            onTap: _isFront ? _toggleFlip : null,
            child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final transform = Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_flipAnimation.value);

                  final isUnder = _flipAnimation.value > math.pi / 2;

                  return Transform(
                    transform: transform,
                    alignment: Alignment.center,

                    // ─── CONTAINER BLOCK ───
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height - 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D1618),
                        // The F1 dark slate background
                        borderRadius: BorderRadius.circular(16),
                        // Smooth rounded outer corners
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.15),
                            width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.6),
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: isUnder
                            ? Transform(
                          transform: Matrix4.rotationY(math.pi),
                          alignment: Alignment.center,
                          child: _buildBack(context),
                        )
                            : _buildFront(),
                      ),

                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  // ─── THE FRONT (F1 Driver Card Style) ───
  Widget _buildFront() {
    final Size size = MediaQuery.of(context).size;
    final bool _isMobile = size.width < 850;

    // ── AUTOMATED AGE TELEMETRY ──
    final DateTime birthDate = DateTime(2003, 10, 28);
    final DateTime today = DateTime.now();
    int calculatedAge = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      calculatedAge--;
    }
    final String liveAge = calculatedAge.toString();

    return Stack(
      fit: StackFit.expand,
      children: [

        // 1. TELEMETRY GRID OVERLAY
        Positioned.fill(
          child: GridPaper(
            color: Colors.white38.withValues(alpha: 0.02),
            divisions: 2,
            subdivisions: 4,
            interval: 100,
          ),
        ),

        // 2. MASSIVE BACKGROUND NUMBER "29"
        Positioned(
          right: _isMobile ? 0 : size.width * 0.15, // Pushed slightly off-screen on mobile, centered right on web
          top: size.height * (_isMobile ? 0.10 : 0.05), // Vertically balanced
          child: Text(
            "29",
            style: TextStyle(
              fontFamily: 'Orbitron',
              fontSize: _isMobile ? 280 : 280, // Scaled massively
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white.withValues(alpha: 0.10), // Subtle watermark
              height: 1.0,
            ),
          ),
        ),

        // 3. VERTICAL RACING STRIPES (Custom Geometry)
        Positioned(
          left: _isMobile ? 60 : 350,
          top: 0,
          bottom: 0,
          width: 60,
          child: CustomPaint(
            size: const Size(30, 140),
            painter: FrontStripesPainter(),
          ),
        ),

        // 4. DRIVER PORTRAIT (Anchored Bottom Right)
        Positioned(
          right: _isMobile ? -90 : size.width * 0.17,
          bottom: - 350,
          height: size.height * (_isMobile ? 0.90 : 1.10), // Takes up bottom 60% of card
          width: size.width * 4.90,
          child: Image.asset(
            'assets/images/mine.png',
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
            errorBuilder: (context, error, stackTrace) {
              return Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 16),
                child: Icon(
                    Icons.person,
                    size: size.height * 0.5,
                    color: Colors.black.withValues(alpha: 0.2)
                ),
              );
            },
          ),
        ),

        // 5. FOREGROUND TEXT CONTENT
        Positioned(
          left: _isMobile ? 25 : 300, // Exactly aligned to the right of the stripes
          top: 0,
          bottom: 0,
          right: 20,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Signature" First Name
                Transform.rotate(
                  angle: - 0.05, // Slight script upward slant
                  child: Text(
                    "Aravind",
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      fontSize: 60,
                      color: Colors.white,
                      height: 0.8,
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),

                const SizedBox(height: 20),

                // Metadata Row (Flag | Role | Number)
                Row(
                  children: [
                    const Text("🇮🇳", style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    const Text(
                      "India",
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(width: 1, height: 12, color: Colors.white54),
                    const SizedBox(width: 12),
                    const Text(
                      "Flutter Developer",
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(width: 1, height: 12, color: Colors.white54),
                    const SizedBox(width: 12),
                    Text(
                      liveAge,
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

                const SizedBox(height: 30),

                // Action Button
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black.withValues(alpha: 0.15),
                  ),
                  child: OutlinedButton.icon(
                    onPressed: _isExporting ? null : () async {
                      // 1. Trigger loading animation
                      setState(() => _isExporting = true);

                      // 2. Simulate processing/downloading telemetry data
                      await Future.delayed(const Duration(milliseconds: 1500));

                      // 3. Stop loading and launch real URL
                      setState(() => _isExporting = false);

                      // Replace this URL with the direct link to your PDF resume (Google Drive, Dropbox, etc.)
                      final Uri url = Uri.parse('https://raw.githubusercontent.com/Aravind-jd/portfolio-assets/main/resume.pdf');
                      try {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication, // Opens Chrome and trigger the download
                        );
                      } catch (e) {
                        debugPrint("Could not launch URL: $e");
                      }
                    },
                    icon: _isExporting
                        ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(color: Colors.white54, strokeWidth: 2))
                        : const Icon(Icons.download_rounded, color: Colors.white54, size: 16),
                    label: Text(
                      _isExporting ? "PROCESSING..." : "RESUME HERE",
                      style: const TextStyle(fontFamily: 'Orbitron', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white54, letterSpacing: 1),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms, duration: 600.ms).scaleXY(begin: 0.8, end: 1.0, curve: Curves.easeOutBack),
              ],
            ),
          ),
        ),
      ],
    );
  }


  // ─── Temporary Back Widget ───
  Widget _buildBack(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool _isMobile = size.width < 850;

    return Scaffold(
      backgroundColor: const Color(0xFF141414), // Base color (Dark Grey) for the page
      // backgroundColor: const Color(0xFF900000),
      // backgroundColor: const Color(0xFF070000),
      // CustomScrollView allows us to create the sticky collapsing header effect
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ─── TOP HALF: THE COLLAPSING F1 HEADER ───
          SliverAppBar(
            expandedHeight: size.height * (_isMobile ? 0.50 : 0.70), // Takes up 50% of screen initially
            pinned: true, // Keeps the name banner stuck to the top when scrolled!
            backgroundColor: const Color(0xFFC00000), // Pure F1 Red
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 0,

            // BOTTOM NAME BANNER & FOOTER (This is the part that sticks)
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: GestureDetector(
                onTap: _toggleFlip,
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFC00000), // Distinct boundary line
                        Color(0xFF900000), // Fades to darker red
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Left Side: Your Name
                      Positioned(
                        top: 8,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInUp(
                                  delay: 600, // Delays name appearance
                                  child: Text(
                                    "Aravind",
                                    style: TextStyle(
                                      fontFamily: 'Caveat',
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                                FadeInUp(
                                  delay: 750, // Cascades directly after the first name
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, bottom: 20),
                                    child: Text(
                                      "Senthilvelan",
                                      style: TextStyle(
                                        fontFamily: 'Orbitron',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const BlinkingLiveBadge(),
                          ],
                        ),
                      ),
                      // Bottom Left: "Built by" text
                      Positioned(
                        bottom: 0.01,
                        left: 20,
                        right: 10,
                        child: FadeInUp(
                          delay: 900,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              const Text(
                                "Personal Center built by Aravind",
                                style: TextStyle(
                                  fontFamily: 'Caveat',
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),

                              TextButton(
                                  onPressed: () {
                                    _toggleFlip();
                                  },
                                  child: Text(
                                    "Tap Here to Flip",
                                    style: TextStyle(
                                      fontFamily: 'Chakra Petch',
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // THE BACKGROUND ELEMENTS (These collapse and scroll out of view)
            flexibleSpace: GestureDetector(
              onTap: _toggleFlip,
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax, // Makes the image slide away smoothly
                background: Stack(
                  children: [
                    // 1. TOP HEADER & TIMER (Pushed down slightly to clear status bar)
                    Positioned(
                      top: _isMobile ? 45 : 30,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          const FadeInUp(
                            delay: 100, // Starts the boot-up sequence
                            child: Text(
                              "PERSONAL CENTER",
                              style: TextStyle(
                                fontFamily: 'Orbitron',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const FadeInUp(
                            delay: 300,
                            child: Text(
                              "LIFE GRAND PRIX",
                              style: TextStyle(
                                fontFamily: 'Orbitron',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FadeInUp(
                            delay: 500,
                            child: Text(
                              _liveAge,
                              style: const TextStyle(
                                fontFamily: 'Orbitron',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 2. THE MASSIVE "29"
                    Positioned(
                      top: _isMobile ? 200 : size.height * 0.15,
                      bottom: _isMobile ? 80 : 120,
                      left: -50,
                      right: -20,
                      child: FadeInUp(
                        delay: 100, // Loads immediately in the background
                        child: Text(
                          "29",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: 310,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            height: 0.85,
                          ),
                        ),
                      ),
                    ),

                    // 3. YOUR IMAGE
                    Positioned(
                      bottom: _isMobile ? 80 : -30,
                      left: 0,
                      right: 0,
                      height: size.height * (_isMobile ? 0.32 : 0.70),
                      child: FadeInUp(
                        delay: 100,
                        child: FractionallySizedBox(
                          widthFactor: _isMobile ? 1.0 : 0.55, // Restricts horizontal spread on desktop so you don't look stretched
                          child: Image.asset(
                            'assets/images/mine.png',
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.person, size: 100, color: Colors.white24);
                            },
                          ),
                        ),

                        // child: ClipRect(
                        //   child: FittedBox(
                        //     fit: BoxFit.contain,
                        //     alignment: Alignment.bottomCenter,
                        //     child: Transform.scale(
                        //       scale: _isMobile ? 1.0 : 1.45,
                        //       child: Image.asset(
                        //         'assets/images/mine.png',
                        //       ),
                        //     )
                        //   ),
                        // ),
                      ),
                    ),

                    // 3.5 THE UPWARD GLOW
                    Positioned(
                      bottom: 110,
                      left: 0,
                      right: 0,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              const Color(0xFFE10600),
                              const Color(0xFFE10600).withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

          // ─── BOTTOM HALF: THE BLACK MENU ZONE ───
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: double.infinity,
              color: const Color(0xFF141414), // F1 App dark background color
              // color: const Color(0xFF070000),
              // color: const Color(0xFF900000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 1. THE HORIZONTAL NAVIGATION MENU
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(), // F1 smooth horizontal scroll
                      child:Row(
                        children: [
                          const SizedBox(width: 20), // Left margin

                          // Generate the buttons dynamically from our list
                          ...List.generate(_menuItems.length, (index) {
                            bool isActive = _selectedMenuIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMenuIndex = index; // Updates the selected tab
                                });
                              },
                              child: FadeInUp(
                                delay: 600,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                                  child: Text(
                                    _menuItems[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Orbitron',
                                      color: isActive ? Colors.white : Colors.white54,
                                      fontSize: 12,
                                      fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),

                          const SizedBox(width: 8), // Right margin
                        ],
                      ),
                    ),
                  ),

                  // 2. THE DYNAMIC CONTENT AREA
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: FadeInUp(
                        delay: 700,

                        child: Builder(
                          builder: (context) {
                            // Display content based on the selected menu index
                            if (_selectedMenuIndex == 0) {
                              return _buildAboutSection();
                            } else if (_selectedMenuIndex == 1) {
                              return _buildCarrerSection();
                            } else if (_selectedMenuIndex == 2) {
                              return _buildProjectSection();
                            } else if (_selectedMenuIndex == 3) {
                              return _buildTechStackSection();
                            } else if (_selectedMenuIndex == 4) {
                              return _buildCertificatesSection();
                            } else if (_selectedMenuIndex == 5) {
                              return _buildContactSection();
                            }
                            return const SizedBox.shrink();

                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  // ─── ABOUT SECTION CONTENT ───
  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "PROFILE OVERVIEW",
            style: TextStyle(
              fontFamily: 'Orbitron',
              color: Colors.white, // F1 Red
              fontSize: 14,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 2,
            width: 70,
            color: Color(0xFFE10600),
            margin: const EdgeInsets.only(bottom: 15),
          ),
          const Text(
            "ARAVIND IS A HYBRID ARCHITECT MERGING TECHNICAL ENGINEERING WITH STRATEGIC MANAGEMENT."
                " BACKED BY A B.E. IN ECE AND DEEP EXPERTISE IN FLUTTER, FIREBASE, AND CLOUD TECHNOLOGIES, HE BUILDS ROBUST DIGITAL SOLUTIONS."
                " CURRENTLY PURSUING AN MBA IN HR AT SRMIST,"
                " HE EXCELS AT ALIGNING SOFTWARE ARCHITECTURE WITH ORGANIZATIONAL GOALS TO DRIVE BOTH PRODUCT PERFORMANCE AND TEAM SYNERGY.",
            style: TextStyle(
              fontFamily: 'Orbitron',
              color: Colors.white70,
              fontSize: 11,
              height: 1.6,
              fontStyle: FontStyle.italic,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 18),

          // Quick Data Points
          _buildInfoRow(Icons.location_on_outlined, "COIMBATORE, TAMIL NADU, INDIA"),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.engineering_outlined, "B.E. ECE (SRI ESHWAR COLLEGE OF ENGINEERING)"),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.account_balance_outlined, "MBA HR MANAGEMENT (SRMIST)"),
        ],
      ),
    );
  }

  // Helper widget for the quick data points
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFFE10600), size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Orbitron',
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ],
    );
  }

  // ─── CARRER SECTION CONTENT ───
  Widget _buildCarrerSection() {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(width: 40, height: 2, color: const Color(0xFFE10600)),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'LAP-BY-LAP TIMELINE',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 28,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(width: 40, height: 2, color: const Color(0xFFE10600)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'CAREER — EACH LAP = MILESTONE',
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white54,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 50),
          // The Timeline Grid
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800), // Keeps it from getting too wide on desktop
              child: Column(
                children: [
                  _buildLapNode(
                    lap: 'LAP 01',
                    year: '2021',
                    title: 'FORMATION LAP',
                    subtitle: 'JOINED B.E. ECE – SRI ESHWAR COLLEGE OF ENGINEERING\nCGPA: 7.79',
                    isFirst: true,
                  ),
                  _buildLapNode(
                    lap: 'LAP 02',
                    year: '2023',
                    title: 'FIRST STINT',
                    subtitle: '· BUILT FIRST FLUTTER PROJECT\n· UDEMY CERTIFICATE ON "MASTERING IN DATA STRUCTURES (C/C++)"\n· CISCO NETWORKING CERTIFIED',
                  ),
                  _buildLapNode(
                    lap: 'LAP 03',
                    year: '2025',
                    title: 'PIT STOP -> MBA',
                    subtitle: 'DOING M.B.A. HUMAN RESOURCE MANAGEMENT - SRMIST, CHENNAI\nCGPA: 9.83',
                  ),
                  _buildLapNode(
                    lap: 'LAP 04',
                    year: 'NEXT',
                    title: 'RACE LEADER',
                    subtitle: 'SYSTEMATICALLY DRIVING ORGANIZATIONAL PERFORMANCE\nTARGETING FULL-STACK / TECH-HR FUSION ROLES',
                    isLast: true,
                    isFuture: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── CARRER SECTION PART CONTENT ───
  Widget _buildLapNode({
    required String lap,
    required String year,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool isFuture = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. The Track Line & Diamond
          SizedBox(
            width: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // The vertical line
                Positioned(
                  top: isFirst ? 30 : 0, // Don't draw line above the first item
                  bottom: isLast ? null : 0, // Don't draw line below the last item
                  height: isLast ? 30 : null,
                  child: Container(
                    width: 2,
                    color: Colors.white12,
                  ),
                ),
                // The Diamond Pit Marker
                Positioned(
                  top: 24, // Aligns diamond with the card title
                  child: Transform.rotate(
                    angle: math.pi / 4, // Rotates a square into a diamond
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: isFuture ? Colors.white24 : const Color(0xFFE10600),
                        boxShadow: isFuture ? [] : [
                          BoxShadow(
                            color: const Color(0xFFE10600),
                            blurRadius: 10,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 2. The Content Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Gap between cards
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: const Color(0xFF151515), // Deep dark grey
                    border: Border(
                        left: BorderSide(
                            color: isFuture ? Colors.white24 : const Color(0xFFE10600),
                            width: 4
                        )
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: const Offset(5, 5),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lap & Year Row
                    Row(
                      children: [
                        Text(
                            lap,
                            style: TextStyle(
                              color: isFuture ? Colors.white38 : const Color(0xFFE10600),
                              fontFamily: "Orbitron",
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                              fontSize: 15,
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(width: 4, height: 4, color: Colors.white38),
                        ),
                        Text(
                            year,
                            style: TextStyle(
                              color: isFuture ? Colors.white38 : const Color(0xFFE10600),
                              fontFamily: "Orbitron",
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                              fontSize: 15,
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Title
                    Text(
                        title,
                        style: TextStyle(
                          color: isFuture ? Colors.white54 : Colors.white,
                          fontSize: 22,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.5,
                        )
                    ),
                    const SizedBox(height: 10),
                    // Subtitle
                    Text(
                        subtitle,
                        style: TextStyle(
                          color: isFuture ? Colors.white38 : Colors.white60,
                          fontFamily: "Orbitron",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.5,
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// ─── PROJECT SECTION CONTENT ───
  Widget _buildProjectSection() {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 40, height: 2, color: const Color(0xFFE10600)),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'R&D GARAGE',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 28,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'ACTIVE DEVELOPMENTS & PROTOTYES',
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white54,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 50),

          _buildProjectCard(
            title: "TEA LEAF DISEASE DETECTION",
            subtitle: "PYTHON / DEEP LEARNING",
            description: "Engineered a predictive model (ResNet, BiLSTM, VGG16) to classify crop diseases. Authored & published in the 2025 IEEE Xplore Digital Library.",
            icon: Icons.code,
            sourceLink: 'https://ieeexplore.ieee.org/document/10961352',
          ),
          SizedBox(height: 10),
          _buildProjectCard(
            title: "BOOK LIBRARY",
            subtitle: "MERN STACK / API INTEGRATION",
            description: "Dynamic frontend web application allowing users to search and view detailed book telemetry using JavaScript-driven APIs.",
            icon: Icons.code,
            sourceLink: 'https://aravind-jd.github.io/Book-Store/',
          ),
          SizedBox(height: 10),
          _buildProjectCard(
            title: "DIGITAL RESUME APP",
            subtitle: "FLUTTER / DART",
            description: "Custom mobile application engineered with a clean UI to digitally display my professional skills, projects, and direct portfolio links.",
            icon: Icons.code,
            sourceLink: 'https://aravind-resume-29.web.app/',
          ),
          SizedBox(height: 10),
          _buildProjectCard(
            title: "F1 TELEMETRY PORTFOLIO",
            subtitle: "FLUTTER WEB / ANIMATE",
            description: "High-speed, highly responsive personal portfolio featuring custom scroll-spy telemetry tracking and interactive DRS animations.",
            icon: Icons.code,
            sourceLink: 'https://aravind-portfolio-a89fb.web.app',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({required String title, required String subtitle, required String description, required IconData icon, required String sourceLink}) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 220,
      ),
      // THE FIX: MouseRegion detects when the cursor enters and leaves the card
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250), // Smooth 0.25s lift
          curve: Curves.easeOutBack, // Gives it a slight "spring" when it pops up
          // THE LIFT: If hovered, move up 10 pixels. If not, stay at 0.
          // transform: Matrix4.identity()..translate(0.0, _isHovered ? -10.0 : 0.0),
          transform: Matrix4.identity()..translateByVector3(Vector3(0.0, _isHovered ? -10.0 : 0.0, 0.0)),
          decoration: BoxDecoration(
            color: const Color(0xFF151515),
            border: const Border(
              left: BorderSide(color: Color(0xFFE10600), width: 4),
            ),
            boxShadow: [
              BoxShadow(
                // THE GLOW: Shifts from black shadow to glowing red when hovered!
                color: Colors.black,
                blurRadius: _isHovered ? 25 : 15,
                offset: _isHovered ? const Offset(0, 15) : const Offset(5, 5),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onHighlightChanged: (isTouched) {
                setState(() => _isHovered = isTouched);
              },
              onTap: () async {
                // Give the UI a tiny moment to show the click ripple
                await Future.delayed(const Duration(milliseconds: 200));

                final Uri url = Uri.parse(sourceLink);

                // THE FIX: Bypassing the canLaunchUrl blocker!
                try {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                  debugPrint("LAUNCHING ${title} SOURCE CODE");
                } catch (e) {
                  debugPrint("Could not launch URL: $e");
                }
              },
              hoverColor: Colors.transparent, // Disable standard tint so our custom lift shines
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Orbitron",
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFFE10600),
                        fontFamily: "Orbitron",
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontFamily: "Orbitron",
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        height: 1.6,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Action Footer
                    Row(
                      children: [
                        Icon(icon, color: _isHovered ? Colors.white : Colors.white38, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'VIEW SOURCE',
                          style: TextStyle(
                            // Highlights the text when hovered
                            color: _isHovered ? Colors.white : Colors.white38,
                            fontFamily: "Orbitron",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

// ─── TECH STACK SECTION CONTENT ───
  Widget _buildTechStackSection() {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 40, height: 2, color: const Color(0xFFE10600)),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'SKILL SPECS',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 28,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'LIVE TELEMETRY METRICS',
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white54,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 50),

          // Feature Upgrade: Live Engine Telemetry (GitHub Integration)
          Row(
            children: [
              const Icon(Icons.hub_outlined, color: Color(0xFFE10600), size: 20),
              const SizedBox(width: 10),
              const Text(
                  'LIVE METRICS (GITHUB)',
                  style: TextStyle(
                      fontFamily: "Orbitron",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Colors.white,
                      letterSpacing: 2,
                  ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 280,
            padding: const EdgeInsets.only(right: 20, left: 5, top: 15, bottom: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF151515),
              border: Border.all(color: Colors.white10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // ─── MINIMAL CHART LEGEND (F1 TEAM STYLE) ───
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem("DART/FLUTTER", const Color(0xFFE10600)), // F1 Red
                      const SizedBox(width: 15),
                      _buildLegendItem("PYTHON", const Color(0xFFFFD43B)),      // Python Yellow
                      const SizedBox(width: 15),
                      _buildLegendItem("WEB (JS/HTML)", const Color(0xFF00FF41)), // Green
                      const SizedBox(width: 15),
                      _buildLegendItem("C/C++, JAVA (DSA)", const Color(0xFF0052CC)),  // Blue
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // ─── THE LINE GRAPH ───
                Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        horizontalInterval: 25,
                        verticalInterval: 1,
                        getDrawingHorizontalLine: (value) => FlLine(color: Colors.white.withValues(alpha: 0.03), strokeWidth: 1),
                        getDrawingVerticalLine: (value) => FlLine(color: Colors.white.withValues(alpha: 0.03), strokeWidth: 1),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            getTitlesWidget: bottomTitleWidgets,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 25,
                            getTitlesWidget: leftTitleWidgets,
                            reservedSize: 40,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: true, border: Border.all(color: Colors.white10)),
                      minX: 0,
                      maxX: 5,   // 4 Milestones / Years (0 to 3)
                      minY: 0,
                      maxY: 100, // Utilization/Volume %
                      lineBarsData: [
                        // 🔴 DART/FLUTTER LINE - Sudden massive acceleration to peak performance
                        _buildF1Line(
                          color: const Color(0xFFE10600),
                          spots: const [FlSpot(0, 0), FlSpot(1, 20), FlSpot(2, 50), FlSpot(3, 75), FlSpot(4, 85), FlSpot(5, 95)],
                          showGlow: true,
                        ),
                        // 🟡 PYTHON LINE - Solid steady trajectory
                        _buildF1Line(
                          color: const Color(0xFFFFFFFF),
                          spots: const [FlSpot(0, 0), FlSpot(1, 0), FlSpot(2, 20), FlSpot(3, 35), FlSpot(4, 60), FlSpot(5, 70)],
                        ),
                        // 🟢 JAVASCRIPT / WEB LINE - Strong mid-field performance
                        _buildF1Line(
                          color: const Color(0xFF00FF41),
                          spots: const [FlSpot(0, 0), FlSpot(1, 20), FlSpot(2, 35), FlSpot(3, 55), FlSpot(4, 60), FlSpot(5, 75)],
                        ),
                        // 🔵 C/C++ LINE - Started strong early on core engineering algorithms
                        _buildF1Line(
                          color: const Color(0xFF0052CC),
                          spots: const [FlSpot(0, 45), FlSpot(1, 70), FlSpot(2, 80), FlSpot(3, 80), FlSpot(4, 80), FlSpot(5, 85)],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          _buildTelemetryBar("FLUTTER & FIREBASE DYNAMICS", 0.95),
          const SizedBox(height: 30),
          _buildTelemetryBar("DATA STRUCTURES & ALGORITHMS", 0.85),
          const SizedBox(height: 30),
          _buildTelemetryBar("PYTHON SCRIPTING", 0.70),
          const SizedBox(height: 30),
          _buildTelemetryBar("HTML, CSS & JAVASCRIPT", 0.75),
          const SizedBox(height: 30),
          _buildTelemetryBar("FIREBASE / BACKEND", 0.80),
          const SizedBox(height: 30),
          _buildTelemetryBar("UI/UX DESIGNING", 0.70),
          const SizedBox(height: 30),
          _buildTelemetryBar("CISCO NETWORKING", 0.80),

        ],
      ),
    );
  }

  // Helper builder to create crisp, uniform F1 racing lines
  LineChartBarData _buildF1Line({required Color color, required List<FlSpot> spots, bool showGlow = false}) {
    return LineChartBarData(
      spots: spots,
      isCurved: true, // Sharp, tactical angular changes like an F1 track chart
      color: color,
      barWidth: 3.5,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(
        show: showGlow,
        color: color.withValues(alpha: 0.08), // Gives a subtle laser glow beneath your primary tech stack
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(width: 10, height: 4, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontFamily: 'Orbitron', color: Colors.white70, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ],
    );
  }

  // ─── X-AXIS LABELS (Months) ───
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontFamily: 'Orbitron', color: Colors.white54, fontSize: 9, fontWeight: FontWeight.bold);
    Widget text;
    switch (value.toInt()) {
      case 0: text = const Text('2021', style: style); break;
      case 1: text = const Text('2022', style: style); break;
      case 2: text = const Text('2023', style: style); break;
      case 3: text = const Text('2024', style: style); break;
      case 4: text = const Text('2025', style: style); break;
      case 5: text = const Text('2026', style: style); break;
      default: text = const Text('', style: style); break;
    }
    return SideTitleWidget(meta: meta, space: 10.0, child: text);
  }

  // ─── Y-AXIS LABELS (Commits/Points) ───
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontFamily: 'Orbitron', color: Colors.white38, fontSize: 9);
    return SideTitleWidget(
      meta: meta,
      space: 8.0,
      child: Text("${value.toInt()}%", style: style),
    );
  }

  Widget _buildTelemetryBar(String label, double percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Orbitron',
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              "${(percentage * 100).toInt()}%",
              style: const TextStyle(
                fontFamily: 'Orbitron',
                color: Color(0xFFE10600),
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE10600),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE10600),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

// ─── CERTIFICATES SECTION CONTENT ───
  Widget _buildCertificatesSection() {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 40, height: 2, color: const Color(0xFFE10600)),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'HOMOLOGATIONS',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 28,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'OFFICIAL LICENSES & CERTIFICATIONS',
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              color: Colors.white54,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 50),

          _buildCertCard("FLUTTER & FIREBASE DEVELOPMENT", "Full-stack mobile application architecture - UDEMY", "01"),
          _buildCertCard("CISCO NETWORKING", "Network infrastructure and data flow systems - CISCO", "02"),
          _buildCertCard("DATA STRUCTURES (C/C++)", "Mastering Data Structures in C/C++ - UDEMY", "03"),
          _buildCertCard("PYTHON PROGRAMMING", "Joy of Commputing usin Python - NPTEL", "04"),
          _buildCertCard("WEB TECHNOLOGIES", "HTML, CSS, and JavaScript - GREAT LEARNING", "05"),

          // const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildCertCard(String title, String issuer, String number) {
    return GestureDetector(
      onTap: () {
        // This opens a full-screen "Telemetry View" of the certificate
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 800,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF151515),
                border: Border.all(color: const Color(0xFF900000)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [

                  Positioned.fill(
                      child: CustomPaint(
                        painter: ExactF1StripesPainter(),
                      ),
                  ),

                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("CERTIFICATE ANALYSIS", style: TextStyle(fontFamily: 'Orbitron', color: Colors.white, fontSize: 15, letterSpacing: 2.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 20),
                        // Placeholder for the actual Image asset
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/certs/cert_$number.jpg', // Dynamic path
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    "VIEWING: $title",
                                    style: TextStyle(
                                        fontFamily: 'Orbitron',
                                        color: Colors.white38,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("CLOSE UPLINK", style: TextStyle(fontFamily: 'Orbitron', letterSpacing: 2.0, fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, color: Color(0xFFE10600))),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 100.0,
        margin: const EdgeInsets.only(bottom: 25),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontFamily: 'Orbitron',
                color: Color(0xFF333333),
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    issuer,
                    style: const TextStyle(
                      fontFamily: 'Orbitron',
                      color: Colors.white54,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.verified, color: Color(0xFFE10600), size: 20), // Changed icon to eye for "Preview"
          ],
        ),
      ),
    );
  }

  // ─── CONTACT SECTION CONTENT (Feature Upgrade: Pit Radio) ───
  Widget _buildContactSection() {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(width: 40, height: 2, color: const Color(0xFFE10600)),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'TELEMETRY CHANNEL',
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 28,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          const Icon(Icons.headset_mic_rounded, color: Color(0xFFE10600), size: 60),
          const SizedBox(height: 20),
          const Text(
            'PIT WALL COMMUNICATIONS',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontFamily: "Orbitron", fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: Colors.white, letterSpacing: 3),
          ),
          const SizedBox(height: 15),
          const Text(
            'OPEN A DIRECT LINE TO DISCUSS PROJECTS, POSITIONS, OR TECHNICAL STRATEGY.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, fontFamily: "Orbitron",fontStyle: FontStyle.italic, color: Colors.white54, letterSpacing: 2, height: 1.5),
          ),
          const SizedBox(height: 40),

          // The Pit Radio Easter Egg Button
          GestureDetector(
            onTap: () async {

              // 1. Wait a moment for the user to read the Easter Egg
              await Future.delayed(const Duration(milliseconds: 1000));

              // 2. Launch the Contact page
              widget.onContactTapped();
              // if (context.mounted) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const ContactPage(isActive: true), // Make sure this matches your actual Contact Page class name!
              //     ),
              //   );
              // }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFE10600),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: const Color(0xFFE10600).withValues(alpha: 0.4), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 5)),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.mail_outline, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'INITIATE RADIO CHECK',
                    style: TextStyle(fontFamily: 'Orbitron', color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

// ─── CUSTOM PAINTER: THE ASYMMETRIC F1 SLASHES ───

class FrontStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // You requested the lines to be white
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final Path path = Path();

    // ─── MEASUREMENTS EXTRACTED FROM THE IMAGE ───
    const double thickW = 20.0;    // The wide left stripe
    const double thinW = 20.0;     // The narrow right stripe
    const double gap = 6.0;       // Space between them

    // Centers the entire stripe assembly on the screen
    final double startX = cx - ((thickW + gap + thinW) / 2);

    // The angle of the cut. The image cuts slant down towards the right (\).
    const double slope = 0.8;
    const double verticalOffset = 110.0; // How close the stripes get to the number

    // Helper function to calculate the precise Y drop for the parallel 45-degree cuts
    double getCutY(double xLocal, double baseCutY) {
      return baseCutY + (xLocal * slope);
    }

    // ─── TOP STRIPES (Coming down from the top edge) ───
    final double topBaseCutY = cy - verticalOffset - 30;

    // Top Thick Stripe (Left)
    path.moveTo(startX, 0);
    path.lineTo(startX + thickW, 0);
    // Slants down to the right
    path.lineTo(startX + thickW, getCutY(thickW, topBaseCutY));
    path.lineTo(startX, getCutY(0, topBaseCutY));
    path.close();

    // Top Thin Stripe (Right)
    final double topThinStartX = startX + thickW + gap;
    path.moveTo(topThinStartX, 0);
    path.lineTo(topThinStartX + thinW, 0);
    // Matches the exact parallel slant of the thick stripe
    path.lineTo(topThinStartX + thinW, getCutY(thickW + gap + thinW, topBaseCutY));
    path.lineTo(topThinStartX, getCutY(thickW + gap, topBaseCutY));
    path.close();

    // ─── BOTTOM STRIPES (Coming up from the bottom edge) ───
    final double bottomBaseCutY = cy + verticalOffset;

    // Bottom Thick Stripe (Left)
    path.moveTo(startX, size.height);
    // Starts the upward slant
    path.lineTo(startX, getCutY(0, bottomBaseCutY));
    path.lineTo(startX + thickW, getCutY(thickW, bottomBaseCutY));
    path.lineTo(startX + thickW, size.height);
    path.close();

    // Bottom Thin Stripe (Right)
    final double bottomThinStartX = startX + thickW + gap;
    path.moveTo(bottomThinStartX, size.height);
    // Matches the exact parallel slant
    path.lineTo(bottomThinStartX, getCutY(thickW + gap, bottomBaseCutY));
    path.lineTo(bottomThinStartX + thinW, getCutY(thickW + gap + thinW, bottomBaseCutY));
    path.lineTo(bottomThinStartX + thinW, size.height);
    path.close();

    // Draw the sharp geometry
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


// ─── CUSTOM PAINTER: THE ASYMMETRIC F1 SLASHES ───

class ExactF1StripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // You requested the lines to be white
    final Paint paint = Paint()
      ..color = Color(0xFF900000)
      ..style = PaintingStyle.fill;

    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final Path path = Path();

    // ─── MEASUREMENTS EXTRACTED FROM THE IMAGE ───
    const double thickW = 20.0;    // The wide left stripe
    const double thinW = 20.0;     // The narrow right stripe
    const double gap = 6.0;       // Space between them

    // Centers the entire stripe assembly on the screen
    final double startX = cx - ((thickW + gap + thinW) / 2);

    // The angle of the cut. The image cuts slant down towards the right (\).
    const double slope = 0.8;
    const double verticalOffset = 150.0; // How close the stripes get to the number

    // Helper function to calculate the precise Y drop for the parallel 45-degree cuts
    double getCutY(double xLocal, double baseCutY) {
      return baseCutY + (xLocal * slope);
    }

    // ─── TOP STRIPES (Coming down from the top edge) ───
    final double topBaseCutY = cy - verticalOffset - 120;

    // Top Thick Stripe (Left)
    path.moveTo(startX, 0);
    path.lineTo(startX + thickW, 0);
    // Slants down to the right
    path.lineTo(startX + thickW, getCutY(thickW, topBaseCutY));
    path.lineTo(startX, getCutY(0, topBaseCutY));
    path.close();

    // Top Thin Stripe (Right)
    final double topThinStartX = startX + thickW + gap;
    path.moveTo(topThinStartX, 0);
    path.lineTo(topThinStartX + thinW, 0);
    // Matches the exact parallel slant of the thick stripe
    path.lineTo(topThinStartX + thinW, getCutY(thickW + gap + thinW, topBaseCutY));
    path.lineTo(topThinStartX, getCutY(thickW + gap, topBaseCutY));
    path.close();

    // ─── BOTTOM STRIPES (Coming up from the bottom edge) ───
    final double bottomBaseCutY = cy + verticalOffset + 65;

    // Bottom Thick Stripe (Left)
    path.moveTo(startX, size.height);
    // Starts the upward slant
    path.lineTo(startX, getCutY(0, bottomBaseCutY));
    path.lineTo(startX + thickW, getCutY(thickW, bottomBaseCutY));
    path.lineTo(startX + thickW, size.height);
    path.close();

    // Bottom Thin Stripe (Right)
    final double bottomThinStartX = startX + thickW + gap;
    path.moveTo(bottomThinStartX, size.height);
    // Matches the exact parallel slant
    path.lineTo(bottomThinStartX, getCutY(thickW + gap, bottomBaseCutY));
    path.lineTo(bottomThinStartX + thinW, getCutY(thickW + gap + thinW, bottomBaseCutY));
    path.lineTo(bottomThinStartX + thinW, size.height);
    path.close();

    // Draw the sharp geometry
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
