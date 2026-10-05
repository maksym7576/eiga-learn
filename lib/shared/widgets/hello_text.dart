import 'package:flutter/material.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_typography.dart';
import 'blur_fade.dart';
import 'gradient_text.dart';
import '../../features/startup/welcome_config.dart';

/// Великий Hello. Анімований заголовок з розмиттям та появленням.
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

    return AnimatedBuilder(
      animation: a,
      builder: (context, child) {
        final t = a.value;
        return BlurFade(
          opacity: t,
          blur: 14 * (1 - t),
          scale: 0.95 + 0.05 * t,
          child: child!,
        );
      },
      child: GradientText(
        text,
        gradient: AppGradients.textIcon,
        style: AppTypography.display.copyWith(
          fontSize: fs,
          fontWeight: FontWeight.w800,
          letterSpacing: -fs * 0.025,
          fontFamilyFallback: const [AppTypography.fontJp],
        ),
      ),
    );
  }
}
