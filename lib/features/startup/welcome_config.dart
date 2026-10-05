import 'package:flutter/material.dart';

/// Єдина таймлінія welcome-екрана (мілісекунди) + кривi + розмір шрифта.
/// Хочеш швидше/повільніше — міняй тільки тут.
class WelcomeConfig {
  WelcomeConfig._();

  static const int totalMs = 6700;

  // Літери e-i-g-a по черзі
  static const List<int> letterStartMs = [0, 100, 200, 300];
  static const int letterDurMs = 650;

  // a -> あ + заливка "eig"
  static const int swapStartMs = 1600;
  static const int swapDurMs = 800;

  // Tagline
  static const int taglineInStartMs = 2550;
  static const int taglineInDurMs = 700;
  static const int taglineOutDurMs = 700;

  // Зникнення логотипу
  static const int outStartMs = 4650;
  static const int logoOutDurMs = 900;

  // Hello
  static const int helloStartMs = 4830;
  static const int helloDurMs = 900;

  // Кнопка
  static const int buttonStartMs = 5930;
  static const int buttonDurMs = 750;

  static const Curve easeOutExpo = Cubic(0.16, 1, 0.3, 1);
  static const Curve easeInOut = Cubic(0.4, 0, 0.2, 1);

  /// Відрізок [startMs, startMs+durMs] головної таймлінії як Animation 0..1.
  static Animation<double> seg(
    Animation<double> master,
    int startMs,
    int durMs, [
    Curve curve = easeOutExpo,
  ]) {
    return master.drive(CurveTween(
      curve: Interval(
        startMs / totalMs,
        (startMs + durMs) / totalMs,
        curve: curve,
      ),
    ));
  }

  /// Розмір великого тексту (eiga / Hello) залежно від ширини екрана.
  static double heroFontSize(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return (w * 0.24).clamp(64.0, 128.0);
  }
}
