import 'package:flutter/material.dart';

class PhraseShimmer extends StatefulWidget {
  final Widget child;
  final bool enabled;
  final Color baseColor;
  final Color highlightColor;

  const PhraseShimmer({
    super.key,
    required this.child,
    this.enabled = true,
    this.baseColor = const Color(0x665A6376),
    this.highlightColor = const Color(0xFFE8EBF2),
  });

  @override
  State<PhraseShimmer> createState() => _PhraseShimmerState();
}

class _PhraseShimmerState extends State<PhraseShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            final value = _controller.value;
            return LinearGradient(
              begin: Alignment(-2.0 + value * 4.0, -1.0),
              end: Alignment(-1.0 + value * 4.0, 1.0),
              stops: const [0.0, 0.5, 1.0],
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}
