import 'package:flutter/material.dart';
import 'package:eiga/database/models/word_models.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';
import 'common.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key, required this.word, this.t, this.showKana = true, this.showRomaji = true});
  final WordEntry word;
  final String Function(String key)? t;
  final bool showKana, showRomaji;

  @override
  Widget build(BuildContext context) {
    final maxCount = word.forms.fold<int>(1, (m, f) => f.count > m ? f.count : m);
    
    final inYourVideosLabel = t != null ? t!('in_your_videos') : 'У твоїх відео';
    final occurrencesLabel = t != null ? t!('occurrences') : 'входжень';
    final videosLabel = t != null ? t!('videos_label') : 'відео';
    final notInVideosYet = t != null ? t!('not_in_videos_yet') : 'ще не зустрічалось у твоїх відео';
    final formsLabel = t != null ? t!('forms_label') : 'Форми';
    final meaningsLabel = t != null ? t!('meanings_in_phrases') : 'Значення у фразах';

    final blocks = <Widget>[
      SectionBlock(
        title: inYourVideosLabel,
        child: word.occurrences > 0
            ? Row(children: [
                Expanded(child: StatTile(value: word.occurrences, label: occurrencesLabel)),
                const SizedBox(width: 8),
                Expanded(child: StatTile(value: word.videos, label: videosLabel)),
              ])
            : EmptyBox(notInVideosYet, padding: 14),
      ),
      if (word.forms.isNotEmpty)
        SectionBlock(
          title: formsLabel,
          child: Column(children: [
            for (final f in word.forms)
              FormRow(form: f, ratio: f.count / maxCount, showKana: showKana, showRomaji: showRomaji)
          ]),
        ),
      if (word.meanings.isNotEmpty)
        SectionBlock(
          title: meaningsLabel,
          child: Wrap(spacing: 6, runSpacing: 6, children: [for (final m in word.meanings) MeaningChip(meaning: m)]),
        ),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (var i = 0; i < blocks.length; i++) ...[if (i > 0) const SizedBox(height: 20), blocks[i]],
    ]);
  }
}

class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.value, required this.label});
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.w(.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.w(.14)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('$value', style: AppText.ui(size: 22, weight: FontWeight.w800, height: 1)),
          const SizedBox(height: 2),
          Text(label, style: AppText.ui(size: 11, weight: FontWeight.w500, color: AppColors.w(.6))),
        ]),
      );
}

class FormRow extends StatelessWidget {
  const FormRow({super.key, required this.form, required this.ratio, required this.showKana, required this.showRomaji});
  final WordForm form;
  final double ratio;
  final bool showKana, showRomaji;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: AppColors.w(.06),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                child: Row(children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(form.text, style: AppText.jp(size: 16)),
                      if (showKana && form.kana != null) ...[
                        const SizedBox(height: 2),
                        Text(form.kana!, style: AppText.ui(size: 12, weight: FontWeight.w500, color: AppColors.w(.75))),
                      ],
                      if (showRomaji && form.romaji != null) ...[
                        const SizedBox(height: 1),
                        Text(form.romaji!, style: AppText.ui(size: 11, weight: FontWeight.w700, color: AppColors.cyanSoft)),
                      ],
                      const SizedBox(height: 2),
                      Text(form.label, style: AppText.ui(size: 11, weight: FontWeight.w500, color: AppColors.w(.6))),
                    ]),
                  ),
                  Text('×${form.count}', style: AppText.ui(size: 14, weight: FontWeight.w700, color: AppColors.cyanSoft)),
                ]),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 3,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: ratio.clamp(0.0, 1.0),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF22D3EE), AppColors.violet]),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
}

class MeaningChip extends StatelessWidget {
  const MeaningChip({super.key, required this.meaning});
  final MeaningCount meaning;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.w(.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.w(.16)),
        ),
        child: Text.rich(TextSpan(children: [
          TextSpan(text: meaning.text, style: AppText.ui(size: 12.5, weight: FontWeight.w700)),
          TextSpan(text: '  ×${meaning.count}', style: AppText.ui(size: 12.5, weight: FontWeight.w700, color: AppColors.cyanSoft)),
        ])),
      );
}
