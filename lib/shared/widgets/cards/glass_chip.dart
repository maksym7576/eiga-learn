import 'package:flutter/material.dart';
import '../../../core/theme/app_typography.dart';

class GlassChip extends StatelessWidget {
  final String text;
  final Color bg;
  final Color? border;
  final double radius, hPad;

  const GlassChip({
    super.key,
    required this.text,
    required this.bg,
    this.border,
    this.radius = 7,
    this.hPad = 7,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 2),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(radius),
          border: border == null ? null : Border.all(color: border!),
        ),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.caption.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      );
}
