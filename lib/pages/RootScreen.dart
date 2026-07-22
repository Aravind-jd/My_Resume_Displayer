import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ChatAiPage.dart';
import 'ContactPage.dart';
import 'MainPage.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key,});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Start on Contact Page for testing

  late AnimationController _reactorController;

  @override
  void initState() {
    super.initState();
    // 🚨 2. Set it to take 4 seconds for one full rotation, and repeat forever
    _reactorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    // 3. Always dispose to prevent memory leaks!
    _reactorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const accentColor = Color(0xFFE10600); // Ferrari Red
    const carbonColor = const Color(0xFF0D1618); // Deep Carbon Black

    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color(0xFF030303),
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Mainpage(
            isActive: _currentIndex == 0,
            // Passing the execution command directly down to the button
            onContactTapped: () {
              setState(() {
                _currentIndex = 2; // Switches the master container to the Contact tab
              });
            },
          ),
          const ChatAiPage(), // Index 1
          ContactPage(isActive: _currentIndex == 2),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isKeyboardOpen ? null : Container(
        margin: const EdgeInsets.only(top: 70), // Pushes button down into the custom bowl
        height: 50,
        width: 50,
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1 ? accentColor : Color(0xFF0D1618),
          elevation: 8,
          shape: const CircleBorder(),
          onPressed: () {
            setState(() {
              _currentIndex = 1; // Switches to AI Chat
            });
          },
          child: RotationTransition(
            turns: _reactorController,
            child: FaIcon(
              FontAwesomeIcons.react,
              color: _currentIndex == 1 ? Colors.white : Colors.white,
              size: 26,
            ),
          ),
        ),
      ),

      // ── THE CUSTOM LIQUID NAVIGATION BAR ──
      bottomNavigationBar: isKeyboardOpen ? null : Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20), // Floats it above the screen bottom
        color: Colors.transparent,
        child: SizedBox(
          width: size.width,
          height: 80, // Total height of the bar
          child: Stack(
            children: [
              // 1. The Custom Painted Curved Background
              CustomPaint(
                size: Size(size.width, 80),
                painter: _LiquidNavBarPainter(
                  color: carbonColor,
                  borderColor: accentColor.withValues(alpha: 0.3),
                ),
              ),

              // 2. The Icons (Left and Right)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LEFT SIDE: TELEMETRY (Home)
                  SizedBox(
                    width: size.width * 0.3,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0), // Aligns icon vertically in the bar
                      child: IconButton(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.idBadge,
                          size: 20,
                          color: _currentIndex == 0 ? accentColor : Color(0xFFFFFFFF),
                        ),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                      ),
                    ),
                  ),

                  // RIGHT SIDE: COMMS (Contact)
                  SizedBox(
                    width: size.width * 0.3,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: IconButton(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.headset,
                          size: 20,
                          color: _currentIndex == 2 ? accentColor : Color(0xFFFFFFFF),
                        ),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LiquidNavBarPainter extends CustomPainter {
  final Color color;
  final Color borderColor;

  _LiquidNavBarPainter({required this.color, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    Paint paint = Paint()
      ..color = const Color(0xFF0A0A0A)
      ..style = PaintingStyle.fill;

    Paint neonGlow = Paint()
      ..color = const Color(0xFF0D1618) // Rosso Corsa
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0 // How far the glow spreads
    // This MaskFilter blurs the stroke, creating the light bleed effect
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0);

    Paint borderPaint = Paint()
      ..color = const Color(0xFFE10600) // You can also change this to Colors.white for a hotter neon look
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    Path path = Path();

    // ── LEFT ENDPLATE (Swept back aero) ──
    path.moveTo(0, h - 20);
    path.lineTo(0, 30);
    // Smooth, rounded top-left corner
    path.quadraticBezierTo(0, 20, 15, 25);

    // ── LEFT MAINPLANE (Smooth transition) ──
    path.quadraticBezierTo(w * 0.10, 35, w * 0.15, 35);
    path.lineTo(w * 0.18, 35); // Flat section

    // ── LEFT ACTIVE FLAP (Rounded Step Down) ──
    // Smoothly curve down...
    path.quadraticBezierTo(w * 0.21, 35, w * 0.23, 40);
    // ...and smoothly curve flat
    path.quadraticBezierTo(w * 0.25, 45, w * 0.27, 45);
    path.lineTo(w * 0.30, 45); // Flat flap section

    // ── LEFT NOSE PYLON (Rounded peaks) ──
    // Curve up from the flap
    path.quadraticBezierTo(w * 0.33, 45, w * 0.35, 35);
    // Smooth rounded tip of the pylon (no sharp spike)
    path.quadraticBezierTo(w * 0.36, 25, w * 0.38, 35);

    // ── THE CRADLE (Smooth nesting bowl) ──
    // Swoop gracefully down into the bowl
    path.quadraticBezierTo(w * 0.42, 65, w * 0.45, 69);
    // Rounded floor transition (Left)
    path.quadraticBezierTo(w * 0.47, 70, w * 0.50, 70);
    // Rounded floor transition (Right)
    path.quadraticBezierTo(w * 0.53, 70, w * 0.55, 69);

    // ── RIGHT NOSE PYLON (Rounded peaks) ──
    // Swoop gracefully up out of the bowl
    path.quadraticBezierTo(w * 0.58, 65, w * 0.62, 35);
    // Smooth rounded tip of the right pylon
    path.quadraticBezierTo(w * 0.64, 25, w * 0.65, 35);

    // ── RIGHT ACTIVE FLAP (Rounded Step Up) ──
    // Curve down from the pylon to the flap
    path.quadraticBezierTo(w * 0.67, 45, w * 0.70, 45);
    path.lineTo(w * 0.73, 45); // Flat flap section

    // Smoothly curve up...
    path.quadraticBezierTo(w * 0.75, 45, w * 0.77, 40);
    // ...and smoothly curve flat
    path.quadraticBezierTo(w * 0.79, 35, w * 0.82, 35);

    // ── RIGHT MAINPLANE & ENDPLATE ──
    path.lineTo(w * 0.85, 35); // Flat section
    // Smooth transition to the rounded outer corner
    path.quadraticBezierTo(w * 0.90, 35, w - 15, 25);
    path.quadraticBezierTo(w, 20, w, 30);
    path.lineTo(w, h - 20); // Down the right side

    // ── BOTTOM UNDERTRAY (Rounded Corners) ──
    // Bottom right rounded corner
    path.quadraticBezierTo(w, h, w - 20, h);
    // Flat bottom edge
    path.lineTo(20, h);
    // Bottom left rounded corner
    path.quadraticBezierTo(0, h, 0, h - 20);

    path.close();

    // ── RENDERING ──
    // The red under-glow shadow
    canvas.drawShadow(path, const Color(0xFFE10600).withValues(alpha: 0.8), 8, true);

    // Draw the carbon black base
    canvas.drawPath(path, paint);

    // Draw the blurred neon red aura
    canvas.drawPath(path, neonGlow);

    // Draw the sharp F1 border
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}