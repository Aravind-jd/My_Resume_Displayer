
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'RootScreen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  late AnimationController _ringController;
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late AnimationController _animationController;


  late Animation<double> _ringRotation;
  late Animation<double> _pulseAnim;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;


  int _litLights = 0;
  bool _lightsOut = false;

  @override
  void initState() {
    super.initState();

    _ringController = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();
    _ringRotation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_ringController);

    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..forward();
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _scaleAnim = Tween<double>(begin: 0.85, end: 1.0).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOutBack));

    // Initialize the engine and set it to loop continuously
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Time for one full rotation (adjust for speed)
    )..repeat(); // repeat() makes it spin forever

    _runLightsSequence();
  }

  Future<void> _runLightsSequence() async {
    // Rapidly fill the progress bar in 2 seconds
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      setState(() => _litLights = i);
    }

    if (!mounted) return;

    // Transition to the main app
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const RootScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }


  @override
  void dispose() {
    _ringController.dispose();
    _pulseController.dispose();
    _fadeController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFE10600);

    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.3, -0.2),
                radius: 0.85,
                colors: [accent.withValues(alpha: 0.12), Colors.transparent],
              ),
            ),
          ),

          // ── TELEMETRY GRID BACKGROUND (Fills the black holes) ──
          Positioned.fill(
            child: CustomPaint(
              painter: FrontStripesPainter(),
            )
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
            right: -300,
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

          // ── MAIN CONTENT ──
          FadeTransition(
            opacity: _fadeAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: Listenable.merge([_ringRotation, _pulseAnim]),
                      builder: (_, __) {
                        return SizedBox(
                          width: 140, height: 140,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Outer spinning dashed ring
                              Transform.rotate(
                                angle: -_ringRotation.value,
                                child: CustomPaint(
                                  size: const Size(140, 140),
                                  painter: _DashedRingPainter(
                                    color: accent.withValues(alpha: 0.4),
                                    strokeWidth: 1.5,
                                  ),
                                ),
                              ),
                              // Reverse spinning inner ring
                              Transform.rotate(
                                angle: _ringRotation.value * 0.6,
                                child: CustomPaint(
                                  size: const Size(100, 100),
                                  painter: _DashedRingPainter(
                                    color: accent.withValues(alpha: 0.5),
                                    rotationAngle: _animationController.value * 2 * math.pi,
                                    strokeWidth: 1,
                                    dashCount: 8,
                                  ),
                                ),
                              ),
                              // Glowing solid border
                              Container(
                                width: 112, height: 112,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: accent, width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: accent.withValues(alpha: _pulseAnim.value * 0.5),
                                      blurRadius: 24,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              // Inner faint ring
                              Container(
                                width: 90, height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: accent.withValues(alpha: 0.3),
                                    width: 1,
                                  ),
                                ),
                              ),
                              // Driver Number
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Text(
                                  '29',
                                  style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: accent,
                                    shadows: [
                                      Shadow(
                                        color: accent.withValues(alpha: 0.6),
                                        blurRadius: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    // Cinematic Progress Bar
                    Container(
                      width: 200,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.white10),
                      ),
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        // The width expands based on the _litLights counter
                        width: (_litLights / 5) * 200,
                        height: 4,
                        decoration: BoxDecoration(
                          color: _lightsOut ? const Color(0xFF00E5FF) : accent,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                                color: (_lightsOut ? const Color(0xFF00E5FF) : accent).withValues(alpha: 0.6),
                                blurRadius: 10,
                                spreadRadius: 2
                            )
                          ],
                        ),
                      ),
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
}

class _DashedRingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final int dashCount;
  final double rotationAngle;

  const _DashedRingPainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.dashCount = 16,
    this.rotationAngle = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth;
    final dashAngle = (2 * math.pi) / dashCount;
    final gapAngle = dashAngle * 0.4;

    // ── THE ANTI-CLOCKWISE OVERRIDE ──
    canvas.save(); // Lock the current canvas state
    canvas.translate(center.dx, center.dy); // Move pivot to center

    // The negative sign (-) forces the anti-clockwise rotation
    canvas.rotate(-rotationAngle);
    canvas.translate(-center.dx, -center.dy); // Move pivot back

    // ── DRAWING LOOP ──
    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * dashAngle;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashAngle - gapAngle,
        false,
        paint,
      );
    }
    canvas.restore(); // Release the canvas state
  }

  @override
  bool shouldRepaint(covariant _DashedRingPainter oldDelegate) {
    // 🚨 Ensures the UI updates every time the angle changes
    return oldDelegate.rotationAngle != rotationAngle ||
        oldDelegate.color != color;
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
    final double topBaseCutY = cy - verticalOffset - 60;

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
    final double bottomBaseCutY = cy + verticalOffset + 50;

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

class CrossStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.03)
      ..style = PaintingStyle.fill;

    // Creates the angled racing stripes pattern
    for (double i = -size.height; i < size.width; i += 80) {
      final path = Path()
        ..moveTo(i, 0)
        ..lineTo(i + 40, 0)
        ..lineTo(i + 40 + size.height, size.height)
        ..lineTo(i + size.height, size.height)
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}