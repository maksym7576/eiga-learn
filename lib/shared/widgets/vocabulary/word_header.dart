import 'package:flutter/material.dart';
import 'package:eiga/database/models/word_models.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';
import 'common.dart';

class WordHeader extends StatelessWidget {
  const WordHeader({super.key, required this.word, required this.showKana, required this.showRomaji, this.t});
  final WordEntry word;
  final bool showKana, showRomaji;
  final String Function(String key)? t;

  @override
  Widget build(BuildContext context) {
    final preparingLabel = t != null ? t!('translation_preparing') : 'переклад готується';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(word.original, style: AppText.jp(size: 38, weight: FontWeight.w800, height: 1.1)),
        const SizedBox(height: 4),
        Wrap(spacing: 12, runSpacing: 4, children: [
          if (showKana) Text(word.kana, style: AppText.ui(size: 15, weight: FontWeight.w500, color: AppColors.w(.75))),
          if (showRomaji)
            Text(word.romaji, style: AppText.ui(size: 15, weight: FontWeight.w700, color: AppColors.cyanSoft)),
        ]),
        const SizedBox(height: 10),
        Wrap(spacing: 6, runSpacing: 6, children: [
          InfoChip(word.pos),
          if (word.jlpt != null) InfoChip(word.jlpt!, kind: ChipKind.jlpt),
          if (word.note != null) InfoChip(word.note!, kind: ChipKind.note),
        ]),
        const SizedBox(height: 10),
        if (word.translation != null)
          Text(word.translation!, style: AppText.ui(size: 17, weight: FontWeight.w800, height: 1.25))
        else ...[
          const SizedBox(height: 4),
          const ShimmerBar(),
          const SizedBox(height: 6),
          Text(preparingLabel, style: AppText.ui(size: 12, weight: FontWeight.w500, color: AppColors.w(.55))),
        ],
      ],
    );
  }
}
