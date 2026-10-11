import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../database/models/phrase.dart';
import '../../../../shared/player/active_player_provider.dart';
import '../providers/player_video_providers.dart';

class PlayerPhraseItem extends HookConsumerWidget {
  final Phrase phrase;

  const PlayerPhraseItem({
    super.key,
    required this.phrase,
  });

  String _getOriginalText() {
    if (phrase.originalVersions.isNotEmpty && phrase.originalVersions.first.text.isNotEmpty) {
      return phrase.originalVersions.first.text;
    }
    if (phrase.sourceTokens.isNotEmpty) {
      final tokenTexts = phrase.sourceTokens.map((t) {
        if (t.versions.isNotEmpty && t.versions.first.text.isNotEmpty) {
          return t.versions.first.text;
        }
        return t.wordId ?? '';
      }).where((s) => s.isNotEmpty).join(' ');
      if (tokenTexts.isNotEmpty) return tokenTexts;
    }
    return '...';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeId = ref.watch(stickyActivePhraseIdProvider);
    final isActive = activeId == phrase.id;

    final originalText = _getOriginalText();
    final translationText = phrase.translatedPhrase;
    final isProcessing = phrase.hasProcessingStage == true || phrase.activeJobId != null;

    final itemOpacity = isActive ? 1.0 : 0.85;

    return RepaintBoundary(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          final pos = Duration(milliseconds: phrase.startTime);
          ref.read(activePlayerProvider.notifier).seek(pos);
          ref.read(activePlayerProvider.notifier).play();
          ref.read(isAutoScrollEnabledProvider.notifier).setEnabled(true);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 12,
            right: 16,
            top: 14,
            bottom: 14,
          ),
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    colors: [
                      Color(0x334D5BF9),
                      Color(0x1A4D5BF9),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  )
                : null,
            color: isActive ? null : Colors.transparent,
            border: Border(
              bottom: const BorderSide(color: Color(0x1AFFFFFF)),
              left: isActive
                  ? const BorderSide(color: Color(0xFF3B66F5), width: 4)
                  : BorderSide.none,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: itemOpacity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Колонна часу
                    _buildTimeColumn(phrase.startTime, isActive),
                    const SizedBox(width: 12),

                    // Текст фрази та переклад
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            originalText,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),
                          if (translationText != null && translationText.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              translationText,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isActive ? const Color(0xFF818CF8) : Colors.white.withOpacity(0.65),
                                height: 1.25,
                              ),
                            ),
                          ] else if (isProcessing) ...[
                            const SizedBox(height: 4),
                            const Text(
                              'Translating...',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF818CF8),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Правий індикатор для активної фрази
              if (isActive)
                Positioned(
                  right: -14,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: 2,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B66F5).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeColumn(int startMs, bool isActive) {
    final duration = Duration(milliseconds: startMs);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    final timeColor = isActive ? const Color(0xFF818CF8) : const Color(0xFF6366F1);
    final subColor = isActive ? const Color(0xFFA5B4FC) : const Color(0xFF818CF8).withOpacity(0.7);

    return SizedBox(
      width: 28,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hours > 0)
            Text(
              '${hours.toString().padLeft(2, '0')}h',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: timeColor,
                height: 1.0,
              ),
            ),
          Text(
            '${minutes}m',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: timeColor,
              height: 1.1,
            ),
          ),
          Text(
            '${seconds}s',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              color: subColor,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
