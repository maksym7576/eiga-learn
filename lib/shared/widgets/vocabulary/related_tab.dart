import 'package:flutter/material.dart';
import 'package:eiga/database/models/word_models.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';
import 'common.dart';

class RelatedTab extends StatelessWidget {
  const RelatedTab({
    super.key,
    required this.word,
    required this.dictionary,
    required this.statusOf,
    required this.onOpen,
    this.t,
  });

  final WordEntry word;
  final Map<String, WordEntry> dictionary;
  final WordStatus Function(String key) statusOf;
  final ValueChanged<String> onOpen;
  final String Function(String key)? t;

  List<Widget> _rows(List<String> keys, {bool antonym = false}) => [
        for (final k in keys)
          if (dictionary[k] != null)
            RelatedWordRow(
              word: dictionary[k]!,
              status: statusOf(k),
              antonym: antonym,
              onTap: () => onOpen(k),
              t: t,
            ),
      ];

  @override
  Widget build(BuildContext context) {
    final syn = _rows(word.synonyms);
    final ant = _rows(word.antonyms, antonym: true);
    final noSynAntLabel = t != null ? t!('no_synonyms_antonyms') : 'Синонімів і антонімів немає';
    final synonymsLabel = t != null ? t!('synonyms') : 'Синоніми';
    final antonymsLabel = t != null ? t!('antonyms') : 'Антоніми';

    if (syn.isEmpty && ant.isEmpty) return EmptyBox(noSynAntLabel);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (syn.isNotEmpty) SectionBlock(title: synonymsLabel, child: Column(children: syn)),
      if (syn.isNotEmpty && ant.isNotEmpty) const SizedBox(height: 20),
      if (ant.isNotEmpty) SectionBlock(title: antonymsLabel, child: Column(children: ant)),
    ]);
  }
}

class RelatedWordRow extends StatelessWidget {
  const RelatedWordRow({super.key, required this.word, required this.status, required this.onTap, this.antonym = false, this.t});
  final WordEntry word;
  final WordStatus status;
  final bool antonym;
  final VoidCallback onTap;
  final String Function(String key)? t;

  @override
  Widget build(BuildContext context) {
    final dot = AppColors.status(status);
    final preparingLabel = t != null ? t!('translation_preparing') : 'переклад готується';

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.w(.07),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.w(antonym ? .22 : .14)),
          ),
          child: Row(children: [
            Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dot,
                border: dot == null ? Border.all(color: AppColors.w(.4), width: 1.5) : null,
              ),
            ),
            const SizedBox(width: 10),
            Text(word.original, style: AppText.jp(size: 18, weight: FontWeight.w800)),
            const SizedBox(width: 10),
            Expanded(
              child: Text('${word.kana} · ${word.translation ?? preparingLabel}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.ui(size: 12, weight: FontWeight.w500, color: AppColors.w(.65))),
            ),
            if (word.note != null) ...[const SizedBox(width: 10), InfoChip(word.note!, kind: ChipKind.note)],
            const SizedBox(width: 10),
            Text(antonym ? '↔' : '›', style: AppText.ui(size: 14, weight: FontWeight.w800, color: AppColors.w(.5))),
          ]),
        ),
      ),
    );
  }
}
