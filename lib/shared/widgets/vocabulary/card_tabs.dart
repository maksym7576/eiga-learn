import 'package:flutter/material.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';

enum CardTab { overview, examples, related }

class CardTabs extends StatelessWidget {
  const CardTabs({super.key, required this.current, required this.onChanged, required this.counts, this.t});
  final CardTab current;
  final ValueChanged<CardTab> onChanged;
  final Map<CardTab, int> counts;
  final String Function(String key)? t;

  String _tabLabel(CardTab tab) {
    if (t == null) {
      return switch (tab) {
        CardTab.overview => 'Огляд',
        CardTab.examples => 'Приклади',
        CardTab.related => 'Схожі',
      };
    }
    return switch (tab) {
      CardTab.overview => t!('tab_overview'),
      CardTab.examples => t!('tab_examples'),
      CardTab.related => t!('tab_related'),
    };
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.w(.14)))),
        child: Row(children: [
          for (final tTab in CardTab.values)
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onChanged(tTab),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: current == tTab ? AppColors.cyan : Colors.transparent, width: 2.5)),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(_tabLabel(tTab),
                        style: AppText.ui(size: 13, weight: FontWeight.w800, color: current == tTab ? Colors.white : AppColors.w(.55))),
                    if ((counts[tTab] ?? 0) > 0) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                        decoration: BoxDecoration(color: AppColors.w(.14), borderRadius: BorderRadius.circular(8)),
                        child: Text('${counts[tTab]}', style: AppText.ui(size: 11, weight: FontWeight.w600)),
                      ),
                    ],
                  ]),
                ),
              ),
            ),
        ]),
      );
}
