import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_typography.dart';
import '../../features/startup/welcome_config.dart';

/// Великий Hello: градієнт + blur/scale-поява. Без обрізання гліфів.
class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
    required this.master,
    required this.text,
    this.fontSize,
  });

  final Animation<double> master;
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final fs = fontSize ?? WelcomeConfig.heroFontSize(context);
    final a = WelcomeConfig.seg(
      master,
      WelcomeConfig.helloStartMs,
      WelcomeConfig.helloDurMs,
    );

    final style = AppTypography.display.copyWith(
      fontSize: fs,
      fontWeight: WelcomeConfig.heroWeight,
      letterSpacing: -fs * 0.025,
      height: 1.0,
      color: Colors.white,
      fontFamilyFallback: const [AppTypography.fontJp],
    );

    // Запас навколо тексту, щоб ShaderMask не різав гліфи.
    final content = ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => AppGradients.textIcon.createShader(rect),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: fs * 0.2, horizontal: fs * 0.06),
        child: Text(text, style: style, maxLines: 1, softWrap: false),
      ),
    );

    return AnimatedBuilder(
      animation: a,
      child: content,
      builder: (context, child) {
        final t = a.value.clamp(0.0, 1.0);
        if (t <= 0) return Opacity(opacity: 0, child: child!);
        final blur = WelcomeConfig.transitionBlur * (1 - t);
        Widget w = child!;
        if (blur > 0.01) {
          w = ImageFiltered(
            imageFilter: ui.ImageFilter.blur(
              sigmaX: blur,
              sigmaY: blur,
              tileMode: TileMode.decal,
            ),
            child: w,
          );
        }
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, fs * WelcomeConfig.transitionLift * (1 - t)),
            child: Transform.scale(scale: 0.95 + 0.05 * t, child: w),
          ),
        );
      },
    );
  }
}