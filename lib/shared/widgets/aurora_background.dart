import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';

class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
  AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();

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
    double opacity = 0.9,
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
      decoration: const BoxDecoration(gradient: AppGradients.bgBase),
      child: LayoutBuilder(
        builder: (context, box) {
          final w = box.maxWidth;
          final h = box.maxHeight;
          final s = math.max(w, h) * 0.95;

          return AnimatedBuilder(
            animation: _c,
            builder: (context, _) {
              final t = _c.value * 2 * math.pi;
              return Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  _blob(
                    left: -0.30 * w + math.sin(t) * 0.05 * w,
                    top: -0.05 * h + math.cos(t) * 0.03 * h,
                    size: s,
                    color: AppColors.iconPurple,
                  ),
                  _blob(
                    left: 0.45 * w + math.cos(t) * 0.05 * w,
                    top: 0.10 * h + math.sin(t) * 0.04 * h,
                    size: s * 0.9,
                    color: AppColors.iconTeal,
                  ),
                  _blob(
                    left: -0.10 * w + math.sin(t + 1) * 0.05 * w,
                    top: 0.45 * h + math.cos(t + 1) * 0.03 * h,
                    size: s * 1.05,
                    color: AppColors.iconIndigo,
                    opacity: 0.95,
                  ),
                  _blob(left: 0.15 * w, top: -0.25 * h, size: s * 0.7, color: AppColors.iconInkDeep),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(gradient: AppGradients.vignette),
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