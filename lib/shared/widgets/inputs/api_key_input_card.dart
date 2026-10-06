import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class ApiKeyInputCard extends StatelessWidget {
  const ApiKeyInputCard({
    super.key,
    required this.controller,
    required this.hint,
    required this.accent,
    required this.obscureText,
    required this.onToggleObscure,
    required this.onPaste,
    this.onRemove,
    this.hasSavedToken = false,
  });

  final TextEditingController controller;
  final String hint;
  final Color accent;
  final bool obscureText;
  final VoidCallback onToggleObscure;
  final VoidCallback onPaste;
  final VoidCallback? onRemove;
  final bool hasSavedToken;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.50),
            blurRadius: 32,
            offset: const Offset(0, 14),
            spreadRadius: -10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            decoration: BoxDecoration(
              color: AppColors.surfaceGlass,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderStrong, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'API SECRET KEY',
                        style: AppTypography.micro.copyWith(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textSubtle,
                        ),
                      ),
                    ),
                    _TextAction(
                      icon: Icons.content_paste_rounded,
                      label: 'Paste',
                      color: accent,
                      onTap: onPaste,
                    ),
                    if (hasSavedToken && onRemove != null) ...[
                      const SizedBox(width: 4),
                      _TextAction(
                        icon: Icons.delete_outline_rounded,
                        label: 'Remove',
                        color: AppColors.danger,
                        onTap: onRemove!,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller,
                  obscureText: obscureText,
                  cursorColor: accent,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.white.withOpacity(0.30),
                    ),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.06),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: _border(AppColors.borderDefault),
                    enabledBorder: _border(AppColors.borderDefault),
                    focusedBorder: _border(accent.withOpacity(0.75), 1.5),
                    suffixIcon: IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        size: 20,
                        color: AppColors.textMuted,
                      ),
                      onPressed: onToggleObscure,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color c, [double w = 1]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: c, width: w),
      );
}

class _TextAction extends StatelessWidget {
  const _TextAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTypography.caption.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
