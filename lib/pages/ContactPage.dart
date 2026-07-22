import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({super.key, required this.isActive});
  final bool isActive;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  bool _isFront = true;

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
  }

  @override
  void didUpdateWidget(ContactPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive && !widget.isActive) {
      if (!_isFront) {
        _flipController.value = 0.0;
        _isFront = true;
      }
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  // ─── THE PIT RADIO ───
  void _toggleFlip() {
      if (_isFront) {
        // Clear any existing banners before showing a new one
        ScaffoldMessenger.of(context).clearSnackBars();

        // Flipping Front -> Back: Trigger the radio message!
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.graphic_eq, color: Color(0xFFE10600)),
                SizedBox(width: 15),
                Text(
                  '"Box Box Box"  "Lets Talk"',
                  style: TextStyle(fontFamily: 'Orbitron',color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
            backgroundColor: Color(0xFF151515),
            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 1500),
          ),
        );
        _flipController.forward();
      } else {
        // Flipping Back -> Front: Instantly hide the message and reverse
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        _flipController.reverse();
      }
      setState(() {
        _isFront = !_isFront;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF0D1618),
      // backgroundColor: const Color(0xFFE10600).withOpacity(0.3),
      backgroundColor: const Color(0xFFE10600),
      body: Center(
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 200,
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
                        : GestureDetector(
                      onTap: _toggleFlip,
                      behavior: HitTestBehavior.opaque,
                      child: _buildFront(),
                    ),
                    // : _buildFront(),
                  ),

                ),
              );
            }
        ),
      ),
    );
  }

  // ─── THE FRONT (Your Locked-In F1 Design) ───
  Widget _buildFront() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: GridPaper(
            color: Colors.white.withValues(alpha: 0.03),
            divisions: 2,
            subdivisions: 4,
            interval: 100,
          ),
        ),
        CustomPaint(
          painter: ExactF1StripesPainter(),
        ),
        const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ─── NUMBER DISPLAY ───
                Text(
                  "29",
                  style: TextStyle(
                    fontFamily: 'Chakra Petch',
                    fontSize: 200,
                    // Slightly adjusted for the new card size
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    height: 1.0,
                    letterSpacing: -8,
                  ),
                ),
                SizedBox(height: 30,),
                // ─── TEXT DISPLAY ───
                Text(
                  "─── ACCESS PROFILE ───",
                  style: TextStyle(
                    fontFamily: 'Chakra Petch',
                    fontSize: 20,
                    // Slightly adjusted for the new card size
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                    height: 1.0,
                    letterSpacing: 3,
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }

  // ─── THE BACK (The Telemetry Contact Form) ───
  Widget _buildBack(BuildContext context) {
    const accentColor = Color(0xFFE10600); // Ferrari Red

    return GestureDetector(
      onTap: _toggleFlip,
      behavior: HitTestBehavior.translucent,
      child: Container(
        color: const Color(0xFF0D1618),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Back Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "SECURE UPLINK",
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.5,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: _toggleFlip, // Flips back to the "29"
                ),
              ],
            ),
            Container(
              height: 2,
              width: 80,
              color: accentColor,
              margin: const EdgeInsets.only(bottom: 24),
            ),

            SizedBox(height: 10),

            Text(
              "─── JOIN THE GRID BY CONNECTING WITH ME ───",
              style: TextStyle(
                fontFamily: 'Orbitron',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: accentColor,
              margin: const EdgeInsets.only(bottom: 24),
            ),

            SizedBox(height: 10),

            // ── The Four Info Cards ──
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    F1ContactTile(
                      label: "PRIMARY COMMS (EMAIL)",
                      value: "aravindhemaa599@gmail.com",
                      url: "mailto:aravindhemaa599@gmail.com",
                      icon: FontAwesomeIcons.envelope,
                      carImagePath: "assets/images/Ferrari_SF26.png",
                      accentColor: const Color(0xFFE10600), // Ferrari Red
                      carWidth: 260.0,
                      carHeight: 110.0,
                      idleLeft: -140.0,
                    ),

                    SizedBox(height: 40),

                    F1ContactTile(
                      label: "SECURE LINE (PHONE)",
                      value: "+91 89034 27447",
                      url: "tel:+918903427447",
                      icon: FontAwesomeIcons.phone,
                      carImagePath: "assets/images/Mercedes_W17.png",
                      accentColor: const Color(0xFF00D2BE), // Mercedes Teal
                      carWidth: 250.0,
                      carHeight: 105.0,
                      idleLeft: -135.0,
                    ),

                    SizedBox(height: 40),

                    F1ContactTile(
                      label: "PROFESSIONAL NETWORK",
                      value: "www.linkedin.com",
                      url: "https://www.linkedin.com/in/aravind-senthilvelan-390469231/",
                      icon: FontAwesomeIcons.linkedin,
                      carImagePath: "assets/images/Mclaren_MCL40.png",
                      accentColor: const Color(0xFFFF8000), // McLaren Papaya
                      carWidth: 230.0,
                      carHeight: 95.0,
                      idleLeft: -125.0,
                    ),

                    SizedBox(height: 40),

                    F1ContactTile(
                      label: "CODE REPOSITORY",
                      value: "www.github.com",
                      url: "https://github.com/Aravind-jd",
                      icon: FontAwesomeIcons.github,
                      carImagePath: "assets/images/Redbull_RB22.png",
                      accentColor: const Color(0xFF0600EF), // Red Bull Blue
                      carWidth: 260.0,
                      carHeight: 110.0,
                      idleLeft: -140.0,
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── NEW: ANIMATED DRIVING CONTACT TILE ───
class F1ContactTile extends StatefulWidget {
  final String label;
  final String value;
  final String url;
  final dynamic icon;
  final String carImagePath;
  final Color accentColor;
  final double carWidth;
  final double carHeight;
  final double idleLeft;

  const F1ContactTile({
    super.key,
    required this.label,
    required this.value,
    required this.url,
    required this.icon,
    required this.carImagePath,
    required this.accentColor,
    this.carWidth = 250.0,
    this.carHeight = 110.0,
    this.idleLeft = -130.0,
  });

  @override
  State<F1ContactTile> createState() => _F1ContactTileState();
}

class _F1ContactTileState extends State<F1ContactTile> {
  // Starts tucked slightly off the left side
  late double _carPosition;
  Duration _driveDuration = const Duration(milliseconds: 2000);
  bool _isDriving = false;

  @override
  void initState() {
    super.initState();
    // Set initial parking spot so only the front wing shows
    _carPosition = widget.idleLeft;
  }

  void _driveCar() {
    if (_isDriving) return;

    setState(() {
      _isDriving = true;
      _driveDuration = const Duration(milliseconds: 2000); // Speed of driving off
      _carPosition = MediaQuery.of(context).size.width; // Drives fully off right
    });

    // 1. Wait for car to leave screen
    Future.delayed(const Duration(milliseconds: 2000), () async {
      if (!mounted) return;

      print("VROOM! Tapped ${widget.label}");
      final uri = Uri.parse(widget.url);
      try {
        if (uri.scheme == 'http' || uri.scheme == 'https') {
          // Force GitHub and LinkedIn to open in the external web browser
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          // Let the OS handle mailto: and tel: naturally
          await launchUrl(uri);
        }
      } catch (e) {
        print("Launch failed: $e");
      }

      // 2. Teleport the car instantly to the far LEFT edge (invisible)
      setState(() {
        _driveDuration = Duration.zero;
        _carPosition = -widget.carWidth - 50;
      });

      // 3. Wait a tiny fraction of a second, then drive it into the parking spot!
      Future.delayed(const Duration(milliseconds: 10), () {
        if (!mounted) return;
        setState(() {
          _driveDuration = const Duration(milliseconds: 400); // Speed of entering the pit
          _carPosition = widget.idleLeft; // Stops with the front wing visible
        });

        // Unlock driving again
        Future.delayed(const Duration(milliseconds: 450), () {
          if (mounted) _isDriving = false;
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _driveCar,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 150, // Fixed height keeps the track uniform
          decoration: BoxDecoration(
            color: const Color(0xFF152226),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Stack(
            children: [
              // 1. Text Details (Pushed right to make room for the parked car)
              Positioned(
                left: 130, // Gives the car its starting space
                right: 16,
                top: 0,
                bottom: 0,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    FaIcon(widget.icon, size: 20, color: Colors.white70),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.label,
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              color: Colors.white.withValues(alpha: 0.4),
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              AnimatedPositioned(
                duration: _driveDuration,
                curve: Curves.easeIn,
                left: 0,
                top: 0,
                bottom: 0,
                // Math trick: The mask width strictly matches the car's tail wing + 30px overlap
                width: math.max(0.0, _carPosition + 30.0),
                child: Container(
                  color: const Color(0xFF152226), // Perfect match to card background
                ),
              ),

              // 2. The Animated Driving Car
              AnimatedPositioned(
                duration: _driveDuration, // Speed of the car
                curve: Curves.easeIn, // Starts slow, then speeds up like an engine rev
                left: _carPosition,
                top: -10,
                bottom: -10,
                child: Center(
                  child: SizedBox(
                    width: widget.carWidth,
                    height: widget.carHeight,
                    child: Image.asset(
                      widget.carImagePath,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.centerRight,
                      errorBuilder: (context, error, stackTrace) {
                        return FaIcon(FontAwesomeIcons.carSide, color: widget.accentColor, size: 40);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── CUSTOM PAINTER: THE ASYMMETRIC F1 SLASHES ───

class ExactF1StripesPainter extends CustomPainter {
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
    const double verticalOffset = 150.0; // How close the stripes get to the number

    // Helper function to calculate the precise Y drop for the parallel 45-degree cuts
    double getCutY(double xLocal, double baseCutY) {
      return baseCutY + (xLocal * slope);
    }

    // ─── TOP STRIPES (Coming down from the top edge) ───
    final double topBaseCutY = cy - verticalOffset - 50;

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
