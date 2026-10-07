import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';

class GlassSheet extends StatelessWidget {
  const GlassSheet({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [BoxShadow(color: Color(0xE6000000), blurRadius: 80, spreadRadius: -12, offset: Offset(0, 30))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              decoration: BoxDecoration(
                color: AppColors.sheet,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.w(.24), width: 1.5),
              ),
              child: child,
            ),
          ),
        ),
      );
}
