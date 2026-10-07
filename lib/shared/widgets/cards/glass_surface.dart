import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Shared glass surface used by cards.
class GlassSurface extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const GlassSurface({
    super.key,
    required this.child,
    required this.padding,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.16)),
        ),
        child: child,
      );
}
