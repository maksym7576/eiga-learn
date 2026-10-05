import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_typography.dart';

/// Чисті стилі та поведінка кнопки без анімації появи.
class PrimaryGradientButton extends StatefulWidget {
  const PrimaryGradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon = Icons.arrow_forward_rounded,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  State<PrimaryGradientButton> createState() => _PrimaryGradientButtonState();
}

class _PrimaryGradientButtonState extends State<PrimaryGradientButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _pressed ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: AppGradients.button,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white.withOpacity(0.20)),
            boxShadow: const [
              BoxShadow(
                color: AppColors.buttonGlow,
                blurRadius: 36,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: AppTypography.title.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                  color: AppColors.textStrong,
                ),
              ),
              if (widget.icon != null) ...[
                const SizedBox(width: 12),
                Icon(widget.icon, size: 18, color: AppColors.textBottom),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
