import 'package:flutter/material.dart';
import 'common.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.backLabel,
    required this.onBack,
    required this.showKana,
    required this.showRomaji,
    required this.onToggleKana,
    required this.onToggleRomaji,
  });

  final String? backLabel;
  final VoidCallback onBack;
  final bool showKana, showRomaji;
  final VoidCallback onToggleKana, onToggleRomaji;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 34,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (backLabel != null) Pill(label: '← $backLabel', onTap: onBack) else const SizedBox(),
            Row(children: [
              Pill(label: 'あ kana', dimmed: !showKana, onTap: onToggleKana),
              const SizedBox(width: 6),
              Pill(label: 'A romaji', dimmed: !showRomaji, onTap: onToggleRomaji),
            ]),
          ],
        ),
      );
}
