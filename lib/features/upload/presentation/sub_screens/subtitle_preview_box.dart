import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/services/depaker/subtitle_depacker_service.dart';
import 'package:eiga/database/dtos/basic_phrase_dto.dart';
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

    final displayItems = sortedPhrases.map((p) {
      final shiftedTime = p.startTime.add(Duration(milliseconds: state.alignShiftMs));
      final t = shiftedTime;
      final timeStr = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:${t.second.toString().padLeft(2, '0')}';
      return (timeStr, p.originalPhrase, p.translatedPhrase ?? '');
    }).toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 280),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 6),
        itemCount: displayItems.length,
        separatorBuilder: (context, index) => Divider(color: Colors.white.withOpacity(0.08), height: 1),
        itemBuilder: (context, index) {
          final line = displayItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 56,
                  child: Text(
                    line.$1,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        line.$2,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      if (line.$3.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          line.$3,
                          style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.white.withOpacity(0.72)),
                        ),
                      ],
                    ],
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
