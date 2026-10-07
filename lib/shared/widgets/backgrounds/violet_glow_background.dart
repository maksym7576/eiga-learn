import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class VioletBlob {
  final double x, y; // 0..1 position on screen
  final double size;
  final Color color;
  const VioletBlob(this.x, this.y, this.size, this.color);
}

/// Dark background with blurred colour blobs. One per screen kind; swap the blobs.
class VioletGlowBackground extends StatelessWidget {
  final List<VioletBlob> blobs;
  final Widget child;
  const VioletGlowBackground({super.key, required this.blobs, required this.child});

  /// Default violet / cyan look.
  factory VioletGlowBackground.violet({Key? key, required Widget child}) => VioletGlowBackground(
        key: key,
        blobs: [
          VioletBlob(.15, .10, 500, AppColors.violet700.withOpacity(.5)),
          VioletBlob(.90, .45, 500, AppColors.sky400.withOpacity(.35)),
          VioletBlob(.30, .95, 600, AppColors.violet800.withOpacity(.55)),
        ],
        child: child,
      );

  /// Same, with a rose glow instead of cyan: for delete screens.
  factory VioletGlowBackground.danger({Key? key, required Widget child}) => VioletGlowBackground(
        key: key,
        blobs: [
          VioletBlob(.15, .10, 500, AppColors.violet700.withOpacity(.5)),
          VioletBlob(.90, .45, 500, AppColors.rose500.withOpacity(.28)),
          VioletBlob(.30, .95, 600, AppColors.violet800.withOpacity(.55)),
        ],
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.ink,
      child: Stack(fit: StackFit.expand, children: [
        for (final b in blobs)
          IgnorePointer(
            child: Align(
              alignment: Alignment(b.x * 2 - 1, b.y * 2 - 1),
              child: OverflowBox(
                maxWidth: b.size,
                maxHeight: b.size,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [b.color, b.color.withOpacity(0)],
                      stops: const [0, .7],
                    ),
                  ),
                  child: SizedBox(width: b.size, height: b.size),
                ),
              ),
            ),
          ),
        child,
      ]),
    );
  }
}
