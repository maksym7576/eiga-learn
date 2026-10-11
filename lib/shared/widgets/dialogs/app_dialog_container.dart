import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Reusable frosted / decorated dialog container background used across app dialogs.
class AppDialogContainer extends StatelessWidget {
  const AppDialogContainer({
    super.key,
    required this.child,
    this.maxWidth = 620,
    this.maxHeight,
    this.padding = const EdgeInsets.all(24.0),
    this.backgroundColor,
    this.borderColor,
    this.blur = true,
  });

  final Widget child;
  final double maxWidth;
  final double? maxHeight;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool blur;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.surfaceDialog;
    final border = borderColor ?? AppColors.borderStrong;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 70,
              spreadRadius: -10,
              offset: const Offset(0, 24),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: blur
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                  child: Container(
                    padding: padding,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: border, width: 1.5),
                    ),
                    child: child,
                  ),
                )
              : Container(
                  padding: padding,
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: border, width: 1.5),
                  ),
                  child: child,
                ),
        ),
      ),
    );
  }
}
