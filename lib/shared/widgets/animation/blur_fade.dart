import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Opacity + blur + зсув + масштаб в одному віджеті.
class BlurFade extends StatelessWidget {
  const BlurFade({
    super.key,
    required this.opacity,
    required this.child,
    this.blur = 0,
    this.dy = 0,
    this.scale = 1,
  });

  final double opacity;
  final double blur;
  final double dy;
  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget w = child;
    w = ImageFiltered(
      imageFilter: ui.ImageFilter.blur(
        sigmaX: blur > 0 ? blur : 0.0,
        sigmaY: blur > 0 ? blur : 0.0,
        tileMode: TileMode.decal,
      ),
      child: w,
    );
    w = Transform.translate(
      offset: Offset(0, dy),
      child: Transform.scale(scale: scale, child: w),
    );
    return Opacity(opacity: opacity.clamp(0.0, 1.0), child: w);
  }
}
