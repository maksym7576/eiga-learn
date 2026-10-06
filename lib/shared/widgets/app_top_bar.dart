import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'logo/mini_app_logo.dart';

/// Універсальна верхня панель (з кнопкою назад та опціональними діями/логотипом праворуч).
class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    this.onBack,
    this.actions,
    this.showLogo = true,
  });

  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surfaceGlass,
                border: Border.all(color: AppColors.borderStrong, width: 1.5),
              ),
              child: const Icon(Icons.arrow_back_rounded, size: 20, color: Colors.white),
            ),
          ),
          if (actions != null)
            Row(mainAxisSize: MainAxisSize.min, children: actions!)
          else if (showLogo)
            const MiniAppLogo(size: 32),
        ],
      ),
    );
  }
}
