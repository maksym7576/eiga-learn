import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/theme/app_typography.dart';
import '../../../features/startup/welcome_config.dart';

/// Анімація логотипу: e-i-g-a з'являються -> "eig" зліва направо
/// заливається градієнтом, a перетворюється в あ -> усе плавно зникає.
class EigaLogoAnimation extends StatelessWidget {
  const EigaLogoAnimation({super.key, required this.master, this.fontSize});

  final Animation<double> master;
  final double? fontSize;

  static double _measure(String s, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: s, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    final w = tp.width;
    tp.dispose();
    return w;
  }

  /// Відстань від верху рядка до baseline — щоб вирівняти різні шрифти.
  static double _baseline(String s, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: s, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    final b = tp.computeDistanceToActualBaseline(TextBaseline.alphabetic);
    tp.dispose();
    return b;
  }

  @override
  Widget build(BuildContext context) {
    final fs = fontSize ?? WelcomeConfig.heroFontSize(context);

    final latin = AppTypography.display.copyWith(
      fontFamily: AppTypography.fontSans,
      fontSize: fs,
      fontWeight: WelcomeConfig.heroWeight,
      letterSpacing: -fs * 0.025,
      height: 1.0,
    );
    final jp = latin.copyWith(
      fontFamily: AppTypography.fontJp,
      fontWeight: WelcomeConfig.jpWeight,
      letterSpacing: 0,
    );

    final aW = _measure('a', latin);
    final jW = _measure('あ', jp);
    // Різні шрифти (латиниця / японська) мають різний baseline —
    // зсуваємо あ так, щоб стояла на одній лінії з e-i-g-a.
    final jpShift = _baseline('a', latin) -
        _baseline('あ', jp) +
        fs * WelcomeConfig.jpBaselineNudge;
    final baseColor = AppTypography.display.color ?? Colors.white;

    final letterAnims = [
      for (final s in WelcomeConfig.letterStartMs)
        WelcomeConfig.seg(master, s, WelcomeConfig.letterDurMs),
    ];
    final swap = WelcomeConfig.seg(
      master,
      WelcomeConfig.swapStartMs,
      WelcomeConfig.swapDurMs,
      WelcomeConfig.easeInOut,
    );
    final out = WelcomeConfig.seg(
      master,
      WelcomeConfig.outStartMs,
      WelcomeConfig.logoOutDurMs,
      WelcomeConfig.easeInOut,
    );

    const letters = ['e', 'i', 'g'];

    return AnimatedBuilder(
      animation: master,
      builder: (context, _) {
        final outVal = out.value;
        final outFade = 1.0 - outVal;
        final outScale = 1.0 + (outVal * 0.06);

        final swapVal = swap.value;
        final slotW = ui.lerpDouble(aW, jW, swapVal)!;

        final aOpacity = (1.0 - (swapVal * 1.5)).clamp(0.0, 1.0);
        final aTranslateY = swapVal * -fs * 0.4;
        final aScale = 1.0 - (swapVal * 0.15);

        final jpOpacity = ((swapVal - 0.2) * 1.43).clamp(0.0, 1.0);
        final jpTranslateY = (1.0 - swapVal) * fs * 0.4 + jpShift;
        final jpScale = 0.85 + (swapVal * 0.15);

        final logo = Opacity(
          opacity: outFade.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: outScale,
            child: SizedBox(
              height: fs * 1.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 'e','i','g': біла база + градієнтний вайп поверх
                  Stack(
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: fs * 0.2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < 3; i++)
                              _buildLetter(
                                letters[i],
                                latin.copyWith(color: baseColor),
                                letterAnims[i].value,
                              ),
                          ],
                        ),
                      ),
                      if (swapVal > 0)
                        ClipRect(
                          clipper: _WipeClipper(swapVal),
                          // Padding ВСЕРЕДИНІ ShaderMask: шар маски включає
                          // запас під хвіст 'g', тож він теж заливається.
                          child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (rect) =>
                                AppGradients.textIcon.createShader(rect),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: fs * 0.2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (final ch in letters)
                                    Text(
                                      ch,
                                      style: latin.copyWith(color: Colors.white),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Слот останнього символу: 'a' -> 'あ'
                  SizedBox(
                    width: slotW,
                    height: fs * 1.5,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Opacity(
                          opacity: aOpacity,
                          child: Transform.translate(
                            offset: Offset(0, aTranslateY),
                            child: Transform.scale(
                              scale: aScale,
                              // 'a' — звичайний білий, без градієнта
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: fs * 0.2),
                                child: Text(
                                  'a',
                                  style: latin.copyWith(color: baseColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: jpOpacity,
                          child: Transform.translate(
                            offset: Offset(0, jpTranslateY),
                            child: Transform.scale(
                              scale: jpScale,
                              child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (rect) =>
                                    AppGradients.textIcon.createShader(rect),
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(vertical: fs * 0.2),
                                  child: Text(
                                    'あ',
                                    style: jp.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Перехід у Hello: їде вгору + розмивається (див. WelcomeConfig).
        final dy = -fs * WelcomeConfig.transitionLift * outVal;
        final blur = WelcomeConfig.transitionBlur * outVal;
        Widget result = Transform.translate(offset: Offset(0, dy), child: logo);
        if (blur > 0.01) {
          result = ImageFiltered(
            imageFilter: ui.ImageFilter.blur(
              sigmaX: blur,
              sigmaY: blur,
              tileMode: TileMode.decal,
            ),
            child: result,
          );
        }
        return result;
      },
    );
  }

  /// Поява літери як в HTML: opacity + blur(16→0) + scale 0.9→1.
  Widget _buildLetter(String char, TextStyle style, double animVal) {
    final v = animVal.clamp(0.0, 1.0);
    final blur = 16.0 * (1.0 - v);

    Widget child = Text(char, style: style);
    if (blur > 0.01) {
      child = ImageFiltered(
        imageFilter: ui.ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
          tileMode: TileMode.decal,
        ),
        child: child,
      );
    }

    return Opacity(
      opacity: v,
      child: Transform.scale(
        scale: 0.9 + (0.1 * v),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

/// Вайп зліва направо із запасом по краях/вертикалі,
/// щоб не обрізати хвіст літери 'g'.
class _WipeClipper extends CustomClipper<Rect> {
  _WipeClipper(this.t);

  final double t;

  @override
  Rect getClip(Size size) {
    final left = -size.width * 0.2;
    final fullRight = size.width * 1.2;
    return Rect.fromLTRB(
      left,
      -size.height * 0.6,
      left + (fullRight - left) * t,
      size.height * 1.6,
    );
  }

  @override
  bool shouldReclip(covariant _WipeClipper old) => old.t != t;
}