import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/shared/player/active_player_provider.dart';
import 'package:eiga/services/database/isar_service.dart';
import '../providers/subtitles_upload_provider.dart';
import '../providers/ai_scan_provider.dart';
import '../../../../shared/widgets/sheets/ai_scan_progress_sheet.dart';
import '../../../../shared/widgets/cards/subtitle_version_card.dart';
import 'subtitle_preview_box.dart';

class ActiveSelectionSection extends ConsumerStatefulWidget {
  const ActiveSelectionSection({super.key});

  @override
  ConsumerState<ActiveSelectionSection> createState() => _ActiveSelectionSectionState();
}

class _ActiveSelectionSectionState extends ConsumerState<ActiveSelectionSection> {
  @override
  Widget build(BuildContext context) {
    final subtitlesState = ref.watch(subtitlesUploadProvider);
    final isManual = subtitlesState.method == SubtitleUploadMethod.manual;
    final aiState = ref.watch(aiScanProvider);
    final aiNotifier = ref.read(aiScanProvider.notifier);
    final playerState = ref.watch(activePlayerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isManual) ...[
          // Action Button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF6366F1), Color(0xFF0EA5E9)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(99, 102, 241, 0.45),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                aiNotifier.runAiScan(
                  videoPath: playerState.videoPath,
                  videoDuration: playerState.duration,
                  appConfig: ref.read(appConfigProvider),
                );
                AiScanProgressSheet.show(context);
              },
              icon: aiState.isScanning
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('AI', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900)),
              label: Text(aiState.isScanning ? 'Checking Sync…' : 'Check Sync AI'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                minimumSize: const Size.fromHeight(44),
              ),
            ),
          ),

          // Sync Result
          if (aiState.scanCompleted) ...[
            const SizedBox(height: 16),
            SubtitleVersionSection(
              versions: aiState.subtitleVersions,
              selectedIndex: aiState.selectedVersionIndex,
              onSelect: (index) {
                aiNotifier.setSelectedVersionIndex(index);
              },
            ),
          ],

          const SizedBox(height: 20),
        ],

        // Subtitle Preview Box
        const SubtitlePreviewBox(),
      ],
    );
  }
}
