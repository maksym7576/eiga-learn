import 'package:flutter/material.dart';
import '../gradien_text.dart';

/// Перевикористовуваний віджет амінованого логотипу Eiga.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.progress,
    this.fontSize = 96.0,
    this.showJapanese = false,
  });

  /// Значення анімації від 0.0 до 1.0
  final Animation<double> progress;
  
  /// Розмір шрифту
  final double fontSize;

  /// Чи показувати японський символ
  final bool showJapanese;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final t = progress.value;
        final opacity = (t * 2).clamp(0.0, 1.0);
        final scale = 0.8 + (t * 0.2);

        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: GradientText(
              showJapanese ? 'あ' : 'eiga',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Для зворотної сумісності
typedef EigaAnimatedLogo = AppLogo;
