import 'package:flutter/material.dart';
import 'package:eiga/database/models/word_models.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';
import 'common.dart';

class ExamplesTab extends StatelessWidget {
  const ExamplesTab({
    super.key,
    required this.examples,
    required this.index,
    required this.onSelect,
    required this.showKana,
    required this.showRomaji,
    this.onPlay,
    this.t,
  });

  final List<Example> examples;
  final int index;
  final ValueChanged<int> onSelect;
  final bool showKana, showRomaji;
  final ValueChanged<Example>? onPlay;
  final String Function(String key)? t;

  @override
  Widget build(BuildContext context) {
    final notInVideosYet = t != null ? t!('not_in_videos_yet') : 'Ще не зустрічалось у твоїх відео';
    if (examples.isEmpty) return EmptyBox(notInVideosYet);
    final i = index.clamp(0, examples.length - 1);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ExamplePager(labels: [for (final e in examples) e.label], selected: i, onSelect: onSelect),
      const SizedBox(height: 10),
      ExampleCard(
        example: examples[i],
        showKana: showKana,
        showRomaji: showRomaji,
        onPlay: onPlay == null ? null : () => onPlay!(examples[i]),
        t: t,
      ),
    ]);
  }
}

class ExamplePager extends StatelessWidget {
  const ExamplePager({super.key, required this.labels, required this.selected, required this.onSelect});
  final List<String> labels;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: i == selected ? AppColors.accent : null,
                    color: i == selected ? null : AppColors.w(.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.w(i == selected ? .4 : .18), width: 1.5),
                  ),
                  child: Text(labels[i], style: AppText.ui(size: 11.5, weight: FontWeight.w800)),
                ),
              ),
            ),
        ]),
      );
}

class ExampleCard extends StatelessWidget {
  const ExampleCard({super.key, required this.example, required this.showKana, required this.showRomaji, this.onPlay, this.t});
  final Example example;
  final bool showKana, showRomaji;
  final VoidCallback? onPlay;
  final String Function(String key)? t;

  @override
  Widget build(BuildContext context) {
    final e = example;
    final meaningLabel = t != null ? t!('meaning_here') : 'Значення тут';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.w(.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.w(.16)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TokenLine(tokens: e.tokens, field: TokenField.original, style: AppText.jp(size: 22), spacing: 2),
        if (showKana)
          TokenLine(tokens: e.tokens, field: TokenField.kana, style: AppText.jp(size: 13, weight: FontWeight.w500, color: AppColors.w(.65))),
        if (showRomaji)
          TokenLine(tokens: e.tokens, field: TokenField.romaji, style: AppText.ui(size: 12, weight: FontWeight.w500, color: AppColors.w(.5))),
        TranslationLine(parts: e.translation),
        const SizedBox(height: 10),
        Wrap(spacing: 6, runSpacing: 6, children: [
          for (final c in e.chips) InfoChip(c),
          InfoChip('$meaningLabel: ${e.meaning}', kind: ChipKind.meaning),
        ]),
        const SizedBox(height: 12),
        PatternBox(pattern: e.pattern, t: t),
        const SizedBox(height: 12),
        SourceBar(text: '${e.source} · ${e.time}', onPlay: onPlay),
      ]),
    );
  }
}

class TokenLine extends StatelessWidget {
  const TokenLine({super.key, required this.tokens, required this.field, required this.style, this.spacing = 0});
  final List<Token> tokens;
  final TokenField field;
  final TextStyle style;
  final double spacing;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Wrap(runSpacing: spacing, children: [
          for (final t in tokens) _TokenView(text: t.pick(field), kind: t.kind, style: style),
        ]),
      );
}

class _TokenView extends StatelessWidget {
  const _TokenView({required this.text, required this.kind, required this.style});
  final String text;
  final TokenKind kind;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final label = Text(text, style: style.copyWith(height: 1.5));
    const pad = EdgeInsets.symmetric(horizontal: 3);
    switch (kind) {
      case TokenKind.plain:
        return Padding(padding: pad, child: label);
      case TokenKind.main:
        return _Highlight(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFF22D3EE).withValues(alpha: .38),
              AppColors.violet.withValues(alpha: .38),
            ]),
          ),
          underline: AppColors.cyan,
          child: label,
        );
      case TokenKind.pattern:
        return _Highlight(
          decoration: BoxDecoration(color: AppColors.violet.withValues(alpha: .2)),
          underline: AppColors.violet.withValues(alpha: .8),
          child: label,
        );
    }
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({required this.decoration, required this.underline, required this.child});
  final BoxDecoration decoration;
  final Color underline;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: DecoratedBox(
            decoration: decoration,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: underline, width: 2))),
              child: child,
            ),
          ),
        ),
      );
}

class TranslationLine extends StatelessWidget {
  const TranslationLine({super.key, required this.parts});
  final List<TrPart> parts;

  @override
  Widget build(BuildContext context) {
    final base = AppText.ui(size: 16, weight: FontWeight.w600);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.w(.12)))),
      child: Text.rich(TextSpan(children: [
        for (final p in parts)
          TextSpan(
            text: p.text,
            style: switch (p.kind) {
              TrKind.plain => base,
              TrKind.italic => base.copyWith(color: AppColors.w(.4)),
              TrKind.highlight => base.copyWith(backgroundColor: const Color(0xFFF472B6).withValues(alpha: .28)),
            },
          ),
      ])),
    );
  }
}

class PatternBox extends StatelessWidget {
  const PatternBox({super.key, this.pattern, this.t});
  final GrammarPattern? pattern;
  final String Function(String key)? t;

  @override
  Widget build(BuildContext context) {
    final p = pattern;
    final accent = p == null ? AppColors.w(.2) : AppColors.violet;
    final noPatternLabel = t != null ? t!('no_patterns_in_phrase') : 'Патернів у цій фразі немає';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        decoration: BoxDecoration(
          color: p == null ? null : AppColors.violet.withValues(alpha: .12),
          border: Border(left: BorderSide(color: accent, width: 3)),
        ),
        child: p == null
            ? Text(noPatternLabel, style: AppText.ui(size: 12.5, weight: FontWeight.w500, color: AppColors.w(.5)))
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(p.pattern, style: AppText.jp(size: 16, weight: FontWeight.w800)),
                  const SizedBox(width: 6),
                  InfoChip(p.level, kind: ChipKind.jlpt),
                ]),
                const SizedBox(height: 4),
                Text(p.title, style: AppText.ui(size: 12.5, weight: FontWeight.w800, height: 1.45)),
                Text(p.description, style: AppText.ui(size: 12.5, weight: FontWeight.w500, color: AppColors.w(.7), height: 1.45)),
              ]),
      ),
    );
  }
}

class SourceBar extends StatelessWidget {
  const SourceBar({super.key, required this.text, this.onPlay});
  final String text;
  final VoidCallback? onPlay;

  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(
          child: Text(text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.ui(size: 12, weight: FontWeight.w500, color: AppColors.w(.7))),
        ),
        const SizedBox(width: 10),
        PlayButton(onTap: onPlay),
      ]);
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            gradient: AppColors.accent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.w(.4)),
          ),
          child: const Icon(Icons.play_arrow_rounded, size: 22, color: Colors.white),
        ),
      );
}
