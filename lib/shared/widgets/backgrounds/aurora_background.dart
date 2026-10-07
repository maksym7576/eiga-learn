import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../core/theme/app_gradients.dart';

class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: const Duration(seconds: 22))..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Widget _blob({
    required double left,
    required double top,
    required double size,
    required Color color,
    double opacity = 0.85,
  }) {
    return Positioned(
      left: left,
      top: top,
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: AppGradients.blob(color, opacity: opacity)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1D0D45), Color(0xFF170A35), Color(0xFF1A1058)],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, box) {
          final w = box.maxWidth;
          final h = box.maxHeight;
          final s = math.max(w, h) * 1.05;

          return AnimatedBuilder(
            animation: _c,
            builder: (context, _) {
              final t = _c.value * 2 * math.pi;
              return Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  _blob(
                    left: -0.25 * w + math.sin(t) * 0.06 * w,
                    top: -0.10 * h + math.cos(t) * 0.04 * h,
                    size: s,
                    color: const Color(0xFF7C3AED),
                    opacity: 0.65,
                  ),
                  _blob(
                    left: 0.50 * w + math.cos(t) * 0.06 * w,
                    top: 0.15 * h + math.sin(t) * 0.05 * h,
                    size: s * 0.95,
                    color: const Color(0xFF0EA5E9),
                    opacity: 0.50,
                  ),
                  _blob(
                    left: -0.15 * w + math.sin(t + 1.5) * 0.05 * w,
                    top: 0.40 * h + math.cos(t + 1.5) * 0.04 * h,
                    size: s * 1.1,
                    color: const Color(0xFF6366F1),
                    opacity: 0.60,
                  ),
                  _blob(
                    left: 0.20 * w + math.cos(t + 2) * 0.04 * w,
                    top: -0.20 * h + math.sin(t + 2) * 0.04 * h,
                    size: s * 0.75,
                    color: const Color(0xFF2563EB),
                    opacity: 0.55,
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          radius: 1.2,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
