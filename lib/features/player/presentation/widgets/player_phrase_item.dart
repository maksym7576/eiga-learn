import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../database/models/phrase.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/player/active_player_provider.dart';
import '../providers/player_video_providers.dart';

class PlayerPhraseItem extends HookConsumerWidget {
  final Phrase phrase;

  const PlayerPhraseItem({
    super.key,
    required this.phrase,
  });

  String _formatTimestamp(int ms) {
    final duration = Duration(milliseconds: ms);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (hours > 0) {
      return '$hours h ${minutes}m ${seconds}s';
    }
    return '${minutes}:${seconds}';
  }

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final pos = Duration(milliseconds: phrase.startTime);
            ref.read(activePlayerProvider.notifier).seek(pos);
            ref.read(activePlayerProvider.notifier).play();
            ref.read(isAutoScrollEnabledProvider.notifier).setEnabled(true);
          },
          borderRadius: BorderRadius.circular(14),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: isActive
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0x4D7C3AED), // Violet glow
                        Color(0x336366F1), // Indigo accent
                        Color(0x1A0C081E),
                      ],
                    )
                  : null,
              color: isActive ? null : AppColors.surfaceGlass,
              border: Border.all(
                color: isActive
                    ? AppColors.cyanLight.withOpacity(0.8)
                    : Colors.white.withOpacity(0.08),
                width: isActive ? 1.5 : 1.0,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.violet700.withOpacity(0.3),
                        blurRadius: 16,
                        spreadRadius: -2,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Індикатор часу
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.violet800.withOpacity(0.6)
                        : Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isActive
                          ? AppColors.cyanLight.withOpacity(0.4)
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    _formatTimestamp(phrase.startTime),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isActive ? AppColors.cyanLight : Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Текст фраз
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Оригінальний текст
                      Text(
                        originalText,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                          color: isActive ? Colors.white : Colors.white.withOpacity(0.9),
                          height: 1.35,
                        ),
                      ),

                      // Переклад
                      if (translationText != null && translationText.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          translationText,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                            color: isActive ? AppColors.cyanLight : AppColors.indigo100.withOpacity(0.75),
                            height: 1.3,
                          ),
                        ),
                      ] else if (isProcessing) ...[
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: AppColors.cyanLight,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Translating...',
                              style: TextStyle(
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: AppColors.cyanLight.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
