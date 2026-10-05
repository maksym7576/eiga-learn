import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        super.key,
        required this.style,
        this.gradient = AppGradients.textIcon,
        this.showShadow = true,
      });

  final String text;
  final TextStyle style;
  final Gradient gradient;
  final bool showShadow;

  static const double padEm = 0.3;

  @override
  Widget build(BuildContext context) {
    final fs = style.fontSize ?? 14.0;
    final pad = EdgeInsets.symmetric(vertical: fs * padEm);
    final base = style.copyWith(height: 1.0);

    final filled = ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Padding(
        padding: pad,
        child: Text(text, style: base.copyWith(color: Colors.white), softWrap: false),
      ),
    );

    if (!showShadow) return filled;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Transform.translate(
          offset: Offset(0, fs * 0.045),
          child: ImageFiltered(
            imageFilter: ui.ImageFilter.blur(sigmaX: fs * 0.05, sigmaY: fs * 0.05),
            child: Padding(
              padding: pad,
              child: Text(text, style: base.copyWith(color: AppColors.textShadow), softWrap: false),
            ),
          ),
        ),
        filled,
      ],
    );
  }
}