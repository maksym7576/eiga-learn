import 'package:flutter/material.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_typography.dart';
import 'blur_fade.dart';
import 'gradient_text.dart';
import '../../features/startup/welcome_config.dart';

/// Анімований підзаголовок (Tagline) для welcome-екрана.
class TaglineText extends StatelessWidget {
  const TaglineText({
    super.key,
    required this.master,
    this.text = 'Learn languages by watching',
  });

  final Animation<double> master;
  final String text;

  @override
  Widget build(BuildContext context) {
    final a = WelcomeConfig.seg(
      master,
      WelcomeConfig.taglineInStartMs,
      WelcomeConfig.taglineInDurMs,
    );

    return AnimatedBuilder(
      animation: a,
      builder: (context, child) {
        final t = a.value;
        return BlurFade(
          opacity: t,
          blur: 10 * (1 - t),
          dy: 10 * (1 - t),
          child: child!,
        );
      },
      child: GradientText(
        text,
        gradient: AppGradients.textIcon,
        style: AppTypography.subtitle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
