import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../features/upload/presentation/providers/ai_scan_provider.dart';
import '../../../features/upload/presentation/providers/subtitles_upload_provider.dart';
import '../cards/subtitle_version_card.dart';
import 'app_bottom_sheet_mobile.dart';

class AiScanProgressSheet extends ConsumerStatefulWidget {
  const AiScanProgressSheet({super.key});

  static Future<void> show(BuildContext context) {
    return AppBottomSheetMobile.show(
      context: context,
      heightFactor: 0.85,
      child: const AiScanProgressSheet(),
    );
  }

  @override
  ConsumerState<AiScanProgressSheet> createState() => _AiScanProgressSheetState();
}

class _AiScanProgressSheetState extends ConsumerState<AiScanProgressSheet> {
  @override
  Widget build(BuildContext context) {
    final aiState = ref.watch(aiScanProvider);
    final aiNotifier = ref.read(aiScanProvider.notifier);
    final uploadNotifier = ref.read(subtitlesUploadProvider.notifier);

    final versions = aiState.subtitleVersions;
    final segments = aiState.calculatedSegments;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0A22),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: const Color(0xFF67E8F9).withOpacity(0.35), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drag handle indicator
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF67E8F9).withOpacity(0.12),
                  border: Border.all(color: const Color(0xFF67E8F9).withOpacity(0.5)),
                ),
                child: const Icon(Icons.cloud_outlined, size: 22, color: Color(0xFF67E8F9)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NEURAL AI SCAN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      aiState.isScanning
                          ? (aiState.statusMessage.isNotEmpty
                              ? aiState.statusMessage
                              : 'Analyzing audio track & subtitles…')
                          : (aiState.scanCompleted
                              ? 'Scan complete!'
                              : 'Ready to start AI sync analysis'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.65),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Scrollable Body
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // AI Scan Panel (Neural Batch Analysis)
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white.withOpacity(0.05),
                      border: Border.all(color: Colors.white.withOpacity(0.14)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'NEURAL BATCH ANALYSIS',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white54, letterSpacing: 0.8),
                            ),
                            Text(
                              '${(aiState.scanProgress * 100).toInt()}%',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Color(0xFF67E8F9)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: LinearProgressIndicator(
                            value: aiState.scanProgress,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF67E8F9)),
                            minHeight: 8,
                          ),
                        ),
                        const SizedBox(height: 16),

                        _buildStageRow(
                          title: 'Extracting audio track',
                          subtitle: 'ffmpeg · mono 16 kHz (${segments.length} segments calculated)',
                          isDone: aiState.scanProgress >= 0.3,
                          isNow: aiState.scanProgress > 0 && aiState.scanProgress < 0.3,
                        ),
                        const SizedBox(height: 8),

                        _buildStageRow(
                          title: 'Detecting speech (Silero VAD)',
                          subtitle: 'silero_vad_v5.onnx · ${aiState.vadResults.isNotEmpty ? aiState.vadResults.length : 0} phrases found',
                          isDone: aiState.scanProgress >= 0.7,
                          isNow: aiState.scanProgress >= 0.3 && aiState.scanProgress < 0.7,
                        ),
                        const SizedBox(height: 8),

                        _buildStageRow(
                          title: 'Matching subtitle versions',
                          subtitle: versions.isNotEmpty
                              ? 'AudioSyncService · ${versions.first.confidence}% match (${versions.length} versions)'
                              : 'Comparing cross-correlation signals…',
                          isDone: aiState.scanCompleted,
                          isNow: aiState.scanProgress >= 0.7 && !aiState.scanCompleted,
                        ),

                        if (aiState.scanCompleted) ...[
                          const SizedBox(height: 12),
                          Text(
                            '✓ Done — ${versions.length} versions analyzed across ${segments.length} calculated video segments',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF34D399)),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Error Message if any
                  if (aiState.errorMessage != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.red.withOpacity(0.12),
                        border: Border.all(color: Colors.red.withOpacity(0.4)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              aiState.errorMessage!,
                              style: const TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Candidate versions list when completed
                  if (aiState.scanCompleted && versions.isNotEmpty) ...[
                    const SizedBox(height: 18),
                    SubtitleVersionSection(
                      versions: versions,
                      selectedIndex: aiState.selectedVersionIndex,
                      onSelect: (index) {
                        aiNotifier.setSelectedVersionIndex(index);
                      },
                      maxHeight: 220,
                    ),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Action: Done button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (versions.isNotEmpty && aiState.selectedVersionIndex < versions.length) {
                    final top = versions[aiState.selectedVersionIndex];
                    uploadNotifier.applyAiRecommendation(top.offsetMs);
                  }
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check_rounded, size: 18),
                label: const Text('Done', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF67E8F9),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStageRow({
    required String title,
    required String subtitle,
    required bool isDone,
    required bool isNow,
  }) {
    Color color = Colors.white38;
    Widget icon = const Icon(Icons.circle_outlined, size: 18, color: Colors.white38);

    if (isDone) {
      color = const Color(0xFF34D399);
      icon = const Icon(Icons.check_circle_rounded, size: 18, color: Color(0xFF34D399));
    } else if (isNow) {
      color = const Color(0xFF67E8F9);
      icon = const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF67E8F9)),
      );
    }

    return Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: color),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 10.5, color: Colors.white.withOpacity(0.55)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
