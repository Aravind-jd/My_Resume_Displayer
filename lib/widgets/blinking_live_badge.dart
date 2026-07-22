// ─── CUSTOM BLINKING BADGE WIDGET ───
import 'package:flutter/cupertino.dart';

class BlinkingLiveBadge extends StatefulWidget {
  const BlinkingLiveBadge({super.key});

  @override
  State<BlinkingLiveBadge> createState() => _BlinkingLiveBadgeState();
}

class _BlinkingLiveBadgeState extends State<BlinkingLiveBadge> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Controls the speed of the blink
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const neonGreen = Color(0xFF00FF41); // The exact green from your reference

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // The pulsing dot
        FadeTransition(
          opacity: _controller,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: neonGreen,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: neonGreen.withValues(alpha: 0.6),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        // The Text
        const Text(
          "LIVE",
          style: TextStyle(
            fontFamily: 'Orbitron',
            color: neonGreen,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }
}