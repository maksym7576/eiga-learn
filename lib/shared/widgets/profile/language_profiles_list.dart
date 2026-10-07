import 'package:flutter/material.dart';
import 'package:eiga/database/models/language_profile.dart';
import '../cards/language_profile_card.dart';
import 'language_profile_ui.dart';

/// Список карток. Активний профіль завжди зверху, решта — за lastOpenedAt.
class LanguageProfilesList extends StatelessWidget {
  const LanguageProfilesList({
    super.key,
    required this.profiles,
    required this.onSelect,
    required this.onDelete,
  });

  final List<LanguageProfile> profiles;
  final ValueChanged<LanguageProfile> onSelect;
  final ValueChanged<LanguageProfile> onDelete;

  List<LanguageProfile> get _sorted {
    final list = [...profiles];
    list.sort((a, b) {
      if (a.isActive != b.isActive) return a.isActive ? -1 : 1;
      return (b.lastOpenedAt ?? DateTime(0))
          .compareTo(a.lastOpenedAt ?? DateTime(0));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final list = _sorted;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 272),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) {
          final p = list[i];
          return LanguageProfileCard(
            title: ProfileLabels.pair(p),
            isActive: p.isActive,
            onTap: () => onSelect(p),
            onDelete: p.isActive ? null : () => onDelete(p),
          );
        },
      ),
    );
  }
}
