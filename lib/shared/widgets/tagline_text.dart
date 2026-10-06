import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../core/theme/app_typography.dart';
import '../../features/startup/welcome_config.dart';

/// Підзаголовок: поява знизу з blur, зникнення вгору перед Hello.
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
    final inAnim = WelcomeConfig.seg(
      master,
      WelcomeConfig.taglineInStartMs,
      WelcomeConfig.taglineInDurMs,
    );
    final outAnim = WelcomeConfig.seg(
      master,
      WelcomeConfig.outStartMs,
      WelcomeConfig.taglineOutDurMs,
    );

    final fontSize = WelcomeConfig.taglineFontSize(context);

    // Звичайний білий (як text-white/75 у HTML), без градієнта.
    // FittedBox: довгий переклад зменшується, а не переноситься/ламає позицію.
    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          maxLines: 1,
          softWrap: false,
          textAlign: TextAlign.center,
          style: AppTypography.subtitle.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            height: 1.2,
            color: Colors.white.withAlpha(191),
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: master,
      child: content,
      builder: (context, child) {
        final tIn = inAnim.value.clamp(0.0, 1.0);
        final tOut = outAnim.value.clamp(0.0, 1.0);
        final opacity = tIn * (1 - tOut);
        // НЕ SizedBox.shrink(): розмір має лишатися сталим, інакше
        // Column перецентровується і все «стрибає».
        if (opacity <= 0) return Opacity(opacity: 0, child: child!);

        final blur = 10 * (1 - tIn) + 8 * tOut;
        final dy = 10 * (1 - tIn) - 8 * tOut;

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
          opacity: opacity,
          child: Transform.translate(offset: Offset(0, dy), child: w),
        );
      },
    );
  }
}