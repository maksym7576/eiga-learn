import 'package:flutter/material.dart';

import 'ghost_button.dart';

/// Кнопка налаштувань: шестерня повертається на 60° при hover.
class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.onPressed,
    required this.tooltip,
  });

  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return GhostButton(
      tooltip: tooltip,
      onPressed: onPressed,
      builder: (_, hovered) => AnimatedRotation(
        turns: hovered ? 60 / 360 : 0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        child: const Icon(Icons.settings_rounded, size: 22),
      ),
    );
  }
}
