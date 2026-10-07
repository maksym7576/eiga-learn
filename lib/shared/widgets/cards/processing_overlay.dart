import 'dart:ui';
import 'package:flutter/material.dart';
import 'video_item.dart';

/// Окремий елемент прогресу: "Transcribing 42%" / "Translating 68%".
/// Кладеться поверх обкладинки: `Positioned.fill(child: ProcessingOverlay(...))`.
class ProcessingOverlay extends StatefulWidget {
  const ProcessingOverlay({
    super.key,
    required this.stage,
    required this.progress,
    this.bottomOffset = 40,
  });

  final ProcessStage stage;

  /// 0..100
  final double progress;

  /// Відступ тексту від низу (щоб не перекривати бейдж JA → UK).
  final double bottomOffset;

  @override
  State<ProcessingOverlay> createState() => _ProcessingOverlayState();
}

class _ProcessingOverlayState extends State<ProcessingOverlay> with TickerProviderStateMixin {
  late final AnimationController _sweep =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1900))..repeat();
  late final AnimationController _text =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))..repeat();

  @override
  void dispose() {
    _sweep.dispose();
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tc = widget.stage == ProcessStage.transcribing;
    final light = tc ? const Color(0xFFA5F3FC) : const Color(0xFFF9A8D4);
    final shimmer = tc ? const Color.fromRGBO(103, 232, 249, .40) : const Color.fromRGBO(244, 114, 182, .36);
    final pct = widget.progress.clamp(0, 100).round();

    return Stack(
      fit: StackFit.expand,
      children: [
        // блік, що біжить
        IgnorePointer(
          child: ClipRect(
            child: LayoutBuilder(builder: (context, box) {
              final bw = box.maxWidth * .45;
              return AnimatedBuilder(
                animation: _sweep,
                builder: (_, __) {
                  final dx = (-1.2 + 4.4 * _sweep.value) * bw;
                  return Stack(children: [
                    Positioned(
                      left: dx,
                      top: 0,
                      bottom: 0,
                      width: bw,
                      child: Transform(
                        transform: Matrix4.skewX(-0.32),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [shimmer.withAlpha(0), shimmer, shimmer.withAlpha(0)],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
              );
            }),
          ),
        ),
        // затемнення
        const ColoredBox(color: Color.fromRGBO(0, 0, 0, .35)),
        // текст
        Positioned(
          left: 12,
          bottom: widget.bottomOffset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tc ? 'TRANSCRIBING' : 'TRANSLATING',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .66,
                  color: light,
                  shadows: const [Shadow(color: Color.fromRGBO(0, 0, 0, .6), blurRadius: 6, offset: Offset(0, 1))],
                ),
              ),
              AnimatedBuilder(
                animation: _text,
                builder: (_, __) => ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (rect) => LinearGradient(
                    colors: [Colors.white, light, Colors.white],
                    stops: const [.3, .5, .7],
                    transform: _SlideGradient(.8 - 1.6 * _text.value),
                  ).createShader(rect),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(text: '$pct', style: const TextStyle(fontSize: 46)),
                      const TextSpan(text: '%', style: TextStyle(fontSize: 22)),
                    ]),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SlideGradient extends GradientTransform {
  const _SlideGradient(this.dx);
  final double dx;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) =>
      Matrix4.translationValues(bounds.width * dx, 0, 0);
}
