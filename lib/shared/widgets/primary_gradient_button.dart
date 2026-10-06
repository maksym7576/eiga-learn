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
    this.isIconLeading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isIconLeading;

  @override
  State<PrimaryGradientButton> createState() => _PrimaryGradientButtonState();
}

class _PrimaryGradientButtonState extends State<PrimaryGradientButton> {
  bool _hover = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() {
        _hover = false;
        _pressed = false;
      }),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, _pressed ? 1.0 : (_hover ? -2.0 : 0.0))
            ..scale(_pressed ? 0.97 : (_hover ? 1.02 : 1.0)),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: _hover
                    ? AppColors.sky400.withOpacity(0.50)
                    : AppColors.buttonGlow,
                blurRadius: _hover ? 44 : 36,
                offset: Offset(0, _hover ? 14 : 10),
              ),
            ],
          ),
          child: Container(
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: AppGradients.button,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Colors.white.withOpacity(_hover ? 0.45 : 0.20),
                width: _hover ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null && widget.isIconLeading) ...[
                  Icon(widget.icon, size: 18, color: AppColors.textBottom),
                  const SizedBox(width: 12),
                ],
                Text(
                  widget.text,
                  style: AppTypography.title.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.4,
                    color: AppColors.textStrong,
                  ),
                ),
                if (widget.icon != null && !widget.isIconLeading) ...[
                  const SizedBox(width: 12),
                  Icon(widget.icon, size: 18, color: AppColors.textBottom),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
