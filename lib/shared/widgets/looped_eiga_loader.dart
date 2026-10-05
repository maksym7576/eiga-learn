import 'package:flutter/material.dart';
import 'eiga_animated_logo.dart';

class LoopedEigaLoader extends StatefulWidget {
  const LoopedEigaLoader({
    super.key,
    this.fontSize = 64.0,
    this.duration = const Duration(seconds: 3),
  });

  final double fontSize;
  final Duration duration;

  @override
  State<LoopedEigaLoader> createState() => _LoopedEigaLoaderState();
}

class _LoopedEigaLoaderState extends State<LoopedEigaLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EigaAnimatedLogo(
      progress: _controller,
      fontSize: widget.fontSize,
    );
  }
}
