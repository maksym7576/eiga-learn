import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class ConfirmButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? accentColor;

  const ConfirmButton({
    super.key,
    required this.label,
    required this.onTap,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: accentColor != null ? accentColor!.withOpacity(0.25) : Colors.white.withOpacity(0.1),
            border: Border.all(
              color: accentColor != null ? accentColor!.withOpacity(0.55) : Colors.white.withOpacity(0.2),
            ),
          ),
          child: Text(
            label,
            style: AppTypography.title.copyWith(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
