import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/core/theme/dark_theme.dart';
import 'package:eiga/database/dtos/basic_phrase_dto.dart';
import 'package:eiga/services/depaker/subtitle_depacker_service.dart';
import 'package:eiga/shared/phrase/core/domain/layer_text.dart';
import 'package:eiga/shared/phrase/core/domain/phrase_view_data.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/layers/default_layout_factory.dart';
import 'package:eiga/shared/phrase/core/layers/layer_source.dart';
import 'package:eiga/shared/phrase/core/parts/phrase_block.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';
import 'package:eiga/shared/phrase/list/list_style_adapter.dart';
import '../providers/subtitles_upload_provider.dart';

class SubtitlePreviewBox extends ConsumerWidget {
  const SubtitlePreviewBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subtitlesUploadProvider);
    final notifier = ref.read(subtitlesUploadProvider.notifier);

    String adjustmentText = '';
    if (state.alignShiftMs != 0 || state.offsetMs > 0) {
      final parts = <String>[];
      if (state.alignShiftMs != 0) {
        final sec = state.alignShiftMs / 1000.0;
        final sign = state.alignShiftMs > 0 ? '+' : '';
        parts.add('Shift: $sign${sec.toStringAsFixed(1)}s');
      }
      if (state.offsetMs > 0) {
        final sec = state.offsetMs / 1000.0;
        parts.add('Padding: +${sec.toStringAsFixed(1)}s');
      }
      adjustmentText = parts.join(' · ');
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.25),
          border: Border.all(color: Colors.white.withOpacity(0.16), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.28),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Row(
                children: [
                  const Text('PREVIEW', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white54, letterSpacing: 0.8)),
                  const SizedBox(width: 8),
                  Text('•', style: TextStyle(color: Colors.white.withOpacity(0.5))),
                  const SizedBox(width: 8),
                  Text(
                    '${state.parsedPhrases.isNotEmpty ? state.parsedPhrases.length : 0} lines',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF67E8F9)),
                  ),
                  if (adjustmentText.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Text('•', style: TextStyle(color: Colors.white.withOpacity(0.5))),
                    const SizedBox(width: 8),
                    Text(
                      adjustmentText,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF34D399)),
                    ),
                  ],
                  const Spacer(),
                  Text(
                    'Clean Brackets',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(width: 8),
                  Switch.adaptive(
                    value: state.cleanBrackets,
                    onChanged: (_) => notifier.toggleCleanBrackets(),
                    activeThumbColor: const Color(0xFF67E8F9),
                  ),
                ],
              ),
            ),
            _buildPreviewLines(state),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewLines(SubtitlesUploadState state) {
    if (state.isLoadingPreview) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF67E8F9)),
          ),
        ),
      );
    }

    if (state.parsedPhrases.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'Select an episode or subtitle file to preview parsed lines',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final List<SubtitlePhrase> phrases = state.cleanBrackets
        ? SubtitleDepackerService.applyDepackingOptions(
            state.parsedPhrases,
            mode: SubtitleDepackMode.hideParentheses,
          )
        : state.parsedPhrases;

    final sortedPhrases = [...phrases]..sort((a, b) => a.startTime.compareTo(b.startTime));

    final layout = DefaultLayoutFactory.create(
      langCode: 'ja',
      availableReadings: [],
      availableTranslations: ['uk'],
    );
    final style = ListStyleAdapter.createStyle(
      baseFontSize: 13.0,
      theme: darkPhraseThemeData,
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 280),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 6),
        itemCount: sortedPhrases.length,
        separatorBuilder: (context, index) => Divider(color: Colors.white.withOpacity(0.08), height: 1),
        itemBuilder: (context, index) {
          final p = sortedPhrases[index];
          final shiftedTime = p.startTime.add(Duration(milliseconds: state.alignShiftMs));
          final timeStr = '${shiftedTime.hour.toString().padLeft(2, '0')}:${shiftedTime.minute.toString().padLeft(2, '0')}:${shiftedTime.second.toString().padLeft(2, '0')}';

          final origWords = p.originalPhrase.split(' ');
          final origTokens = origWords.asMap().entries.map((e) => Token(text: e.value, index: e.key)).toList();

          final transWords = (p.translatedPhrase ?? '').split(' ');
          final transTokens = transWords.asMap().entries.map((e) => Token(text: e.value, index: e.key)).toList();

          final viewData = PhraseViewData(
            phraseId: index.toString(),
            start: Duration(milliseconds: p.startTime.millisecondsSinceEpoch),
            end: Duration(milliseconds: p.endTime.millisecondsSinceEpoch),
            texts: {
              const ReadingSource('original'): LayerText(tokens: origTokens),
              if (p.translatedPhrase != null && p.translatedPhrase!.isNotEmpty)
                const TranslationSource('uk'): LayerText(tokens: transTokens),
            },
          );

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 56,
                  child: Text(
                    timeStr,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                    ),
                  ),
                ),
                Expanded(
                  child: PhraseBlock(
                    viewData: viewData,
                    layout: layout,
                    style: style,
                    colors: const WordColors(darkPhraseThemeData),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
