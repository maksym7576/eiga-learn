import 'package:flutter/material.dart';

/// ВСЕ налаштування welcome-екрана в одному місці.
///
/// Що тут лежить:
///  1. Таймлінія (мс) — коли що починається і скільки триває.
///  2. Криві анімацій.
///  3. Параметри переходу eiga -> Hello.
///  4. Розміри (шрифт, відступ tagline).
///  5. seg() — допоміжна функція: бере головний контролер (0..1)
///     і віддає його шматок [start, start+dur] як окрему анімацію 0..1.
///
/// Назву класу й шлях файлу не змінюй — на нього посилаються інші файли.
class WelcomeConfig {
  WelcomeConfig._();

  // ───────────────── 1. ТАЙМЛІНІЯ (мс) ─────────────────
  // Швидше/повільніше — міняй числа нижче. totalMs рахується сам.

  // Літери e-i-g-a з'являються по черзі
  static const List<int> letterStartMs = [0, 70, 140, 210];
  static const int letterDurMs = 450;

  // a -> あ + заливка "eig" (довша = плавніше замальовування)
  static const int swapStartMs = 800;
  static const int swapDurMs = 1100;

  // Tagline: поява (починається, коли заливка майже завершена)
  static const int taglineInStartMs = 1650;
  static const int taglineInDurMs = 500;
  // Tagline: зникнення (починається разом з outStartMs)
  static const int taglineOutDurMs = 500;

  /// ПАУЗА: скільки tagline просто стоїть повністю видимий до переходу в Hello.
  static const int taglineHoldMs = 1300;

  // Зникнення логотипу eiga (після паузи)
  static const int outStartMs = taglineInStartMs + taglineInDurMs + taglineHoldMs;
  static const int logoOutDurMs = 650;

  // Hello (починається, коли eiga вже зникає)
  static const int helloStartMs = outStartMs + 150;
  static const int helloDurMs = 650;

  // Кнопки
  static const int buttonStartMs = helloStartMs + helloDurMs - 100;
  static const int buttonDurMs = 550;

  /// Загальна тривалість — рахується автоматично.
  static const int totalMs = buttonStartMs + buttonDurMs;

  // ───────────────── 2. КРИВІ ─────────────────
  static const Curve easeOutExpo = Cubic(0.16, 1, 0.3, 1);
  static const Curve easeInOut = Cubic(0.4, 0, 0.2, 1);

  // ───────────────── 3. ПЕРЕХІД eiga -> Hello ─────────────────
  /// eiga їде вгору, Hello виїжджає знизу: зсув у частках fontSize.
  /// 0 = без зсуву, 0.15 = помітний, 0.3 = сильний.
  static const double transitionLift = 0.15;

  /// Максимальне розмиття (sigma) під час переходу.
  static const double transitionBlur = 14.0;

  // ───────────────── 4. РОЗМІРИ ─────────────────
  /// Відступ між eiga/Hello і tagline (частка fontSize).
  /// Може бути ВІД'ЄМНИМ: -0.05 = ближче до тексту, 0.1 = далі.
  /// Якщо налазить на хвіст 'g' — збільш (наприклад -0.01).
  static const double taglineGap = -0.05;

  /// Ручна підгонка あ по вертикалі (частка fontSize), поверх автовирівнювання
  /// по baseline. Додатне = нижче, від'ємне = вище. Зазвичай 0.
  static const double jpBaselineNudge = 0.0;

  /// Товщина великого тексту (eiga / Hello). Тонше: w600, товще: w800.
  static const FontWeight heroWeight = FontWeight.w700;

  /// Товщина あ (японський шрифт зазвичай виглядає товстішим за латиницю).
  static const FontWeight jpWeight = FontWeight.w500;

  /// Розмір великого тексту (eiga / Hello) залежно від ширини екрана.
  static double heroFontSize(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return (w * 0.24).clamp(64.0, 128.0);
  }

  /// Розмір tagline — прив'язаний до розміру hero-тексту.
  static double taglineFontSize(BuildContext context) {
    return (heroFontSize(context) * 0.14).clamp(13.0, 18.0);
  }

  // ───────────────── 5. ДОПОМІЖНЕ ─────────────────
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
}