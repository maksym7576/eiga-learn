import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_typography.dart';
import 'blur_fade.dart';
import 'gradien_text.dart';
import '../../features/startup/welcome_config.dart';

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
    return tp.width;
  }

  @override
  Widget build(BuildContext context) {
    final fs = fontSize ?? WelcomeConfig.heroFontSize(context);

    final latin = AppTypography.display.copyWith(
      fontFamily: AppTypography.fontSans,
      fontSize: fs,
      fontWeight: FontWeight.w800,
      letterSpacing: -fs * 0.025,
      height: 1.0,
    );
    final jp = latin.copyWith(
      fontFamily: AppTypography.fontJp,
      letterSpacing: 0,
    );

    final aW = _measure('a', latin);
    final jW = _measure('あ', jp);

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

    return AnimatedBuilder(
      animation: out,
      builder: (context, child) {
        final t = out.value;
        return BlurFade(
          opacity: 1 - t,
          blur: 12 * t,
          scale: 1 + 0.05 * t,
          child: child!,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _EigWord(
            style: latin,
            fontSize: fs,
            letterAnims: letterAnims.sublist(0, 3),
            wipe: swap,
          ),
          _LastCharSlot(
            latin: latin,
            jp: jp,
            fontSize: fs,
            aWidth: aW,
            jWidth: jW,
            letterIn: letterAnims[3],
            swap: swap,
          ),
        ],
      ),
    );
  }
}

/// "eig": знизу білі літери, зверху градієнтна копія, відкрита вайпом.
class _EigWord extends StatelessWidget {
  const _EigWord({
    required this.style,
    required this.fontSize,
    required this.letterAnims,
    required this.wipe,
  });

  final TextStyle style;
  final double fontSize;
  final List<Animation<double>> letterAnims;
  final Animation<double> wipe;

  static const _letters = ['e', 'i', 'g'];

  @override
  Widget build(BuildContext context) {
    final base = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 3; i++)
          AnimatedBuilder(
            animation: letterAnims[i],
            builder: (context, child) {
              final t = letterAnims[i].value;
              return BlurFade(
                opacity: t,
                blur: 14 * (1 - t),
                scale: 0.9 + 0.1 * t,
                child: child!,
              );
            },
            child: GradientText(
              _letters[i],
              style: style,
              gradient: AppGradients.textWhite,
            ),
          ),
      ],
    );

    final overlay = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final l in _letters)
          GradientText(
            l,
            style: style,
            gradient: AppGradients.textIcon,
            showShadow: false,
          ),
      ],
    );

    return Stack(
      children: [
        base,
        AnimatedBuilder(
          animation: wipe,
          builder: (context, child) => ClipRect(
            clipper: _WipeClipper(wipe.value, fontSize * 0.5),
            child: child,
          ),
          child: overlay,
        ),
      ],
    );
  }
}

/// Клип-вайп зліва направо із запасом по краях (щоб нічого не різалось).
class _WipeClipper extends CustomClipper<Rect> {
  _WipeClipper(this.progress, this.pad);

  final double progress;
  final double pad;

  @override
  Rect getClip(Size size) {
    final left = -pad;
    final fullRight = size.width + pad;
    return Rect.fromLTRB(
      left,
      -pad,
      left + (fullRight - left) * progress,
      size.height + pad,
    );
  }

  @override
  bool shouldReclip(_WipeClipper old) => old.progress != progress;
}

/// Слот останньої літери: a виїжджає вгору, あ заїжджає знизу, ширина плавно змінюється.
class _LastCharSlot extends StatelessWidget {
  const _LastCharSlot({
    required this.latin,
    required this.jp,
    required this.fontSize,
    required this.aWidth,
    required this.jWidth,
    required this.letterIn,
    required this.swap,
  });

  final TextStyle latin;
  final TextStyle jp;
  final double fontSize;
  final double aWidth;
  final double jWidth;
  final Animation<double> letterIn;
  final Animation<double> swap;

  @override
  Widget build(BuildContext context) {
    final slotH = fontSize * 1.15;

    return AnimatedBuilder(
      animation: Listenable.merge([letterIn, swap]),
      builder: (context, _) {
        final s = swap.value;
        final li = letterIn.value;
        final width = lerpDouble(aWidth, jWidth, s)!;

        return SizedBox(
          width: width,
          height: slotH,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // a (виїжджає вгору)
              Transform.translate(
                offset: Offset(0, -0.8 * slotH * s),
                child: BlurFade(
                  opacity: li * (1 - s),
                  blur: 14 * (1 - li) + 8 * s,
                  scale: 0.9 + 0.1 * li,
                  child: GradientText('a', style: latin, gradient: AppGradients.textWhite),
                ),
              ),
              // あ (заїжджає знизу)
              Transform.translate(
                offset: Offset(0, 0.8 * slotH * (1 - s)),
                child: BlurFade(
                  opacity: s,
                  blur: 8 * (1 - s),
                  child: GradientText('あ', style: jp, gradient: AppGradients.textIcon),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
