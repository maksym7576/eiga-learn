import 'package:flutter/material.dart';

class PhraseBackdrop extends StatelessWidget {
  final Widget child;
  final bool showBackdrop;
  final double opacity;
  final double padding;
  final Color color;
  final BorderRadius borderRadius;

  const PhraseBackdrop({
    super.key,
    required this.child,
    this.showBackdrop = true,
    this.opacity = 0.6,
    this.padding = 8.0,
    this.color = Colors.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  Widget build(BuildContext context) {
    if (!showBackdrop || opacity <= 0) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      );
    }

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color.withOpacity(opacity.clamp(0.0, 1.0)),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
