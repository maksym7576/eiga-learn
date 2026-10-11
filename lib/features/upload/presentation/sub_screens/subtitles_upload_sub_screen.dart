import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/shared/widgets/cards/glass_card.dart';
import 'package:eiga/features/upload/presentation/providers/upload_match_provider.dart';
import 'empty_player.dart';
import 'video_info_row.dart';
import 'manual_sub_view.dart';
import 'ai_audio_sub_view.dart';
import 'video_track_sub_view.dart';
import 'active_selection_section.dart';
import '../providers/subtitles_upload_provider.dart';

class SubtitlesUploadSubScreen extends ConsumerStatefulWidget {
  final List<Map<String, String>> subtitleTracks;
  final int? selectedSubtitle;
  final ValueChanged<int>? onSubtitleSelected;

  const SubtitlesUploadSubScreen({
    super.key,
    this.subtitleTracks = const [],
    this.selectedSubtitle,
    this.onSubtitleSelected,
  });

  @override
  ConsumerState<SubtitlesUploadSubScreen> createState() => _SubtitlesUploadSubScreenState();
}

class _SubtitlesUploadSubScreenState extends ConsumerState<SubtitlesUploadSubScreen> {
  late final ScrollController _aiScrollController;

  @override
  void initState() {
    super.initState();
    _aiScrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(subtitlesUploadProvider);
      if (state.rawFiles.isEmpty) {
        ref.read(subtitlesUploadProvider.notifier).fetchJimakuFiles();
      }
    });
  }

  @override
  void dispose() {
    _aiScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(subtitlesUploadProvider);
    final notifier = ref.read(subtitlesUploadProvider.notifier);
    final matchState = ref.watch(uploadMatchProvider);
    final sourceId = matchState.selectedSubtitleSourceId;

    String subtitleText = 'Pick an episode, find subtitles and fine-tune the timing.';
    if (sourceId == 'local') {
      subtitleText = 'Pick a local subtitle file (.srt / .ass) and fine-tune the timing.';
    } else if (sourceId == 'ai') {
      subtitleText = 'Generate subtitles automatically from the video’s audio.';
    } else if (sourceId == 'video') {
      subtitleText = 'Extract subtitles from embedded video tracks.';
    }

    return AppGlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title & Subtitle
          const Text(
            'Subtitles & Sync',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitleText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),

          // Render view based on Step 2 subtitle source selection (ai, local, cloud, video)
          if (sourceId == 'local') ...[
            _buildSectionLabel('Local Subtitle File'),
            const SizedBox(height: 8),
            if (state.selectedFile == null)
              EmptyPlayer(
                onAddVideo: () => notifier.pickLocalSubtitleFile(),
                label: 'Pick .srt / .ass file',
              )
            else ...[
              VideoInfoRow(
                title: state.selectedFile,
                details: state.localFilePath,
                onReplace: () => notifier.pickLocalSubtitleFile(),
              ),
              const SizedBox(height: 24),
              const ActiveSelectionSection(),
            ],
          ] else if (sourceId == 'ai') ...[
            _buildSectionLabel('Neural Audio Transcription'),
            const SizedBox(height: 8),
            const AiAudioSubView(),
            if (state.scanCompleted || state.isScanning || state.parsedPhrases.isNotEmpty) ...[
              const SizedBox(height: 24),
              const ActiveSelectionSection(),
            ],
          ] else if (sourceId == 'video') ...[
            _buildSectionLabel('Embedded Video Subtitles'),
            const SizedBox(height: 8),
            VideoTrackSubView(
              subtitleTracks: widget.subtitleTracks,
              selectedSubtitle: widget.selectedSubtitle,
              onSubtitleSelected: widget.onSubtitleSelected,
            ),
          ] else ...[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.28),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white.withOpacity(0.14), width: 1.5),
              ),
              child: Row(
                children: [
                  _buildMethodPill(SubtitleUploadMethod.ai, 'AI Scan', state, notifier),
                  _buildMethodPill(SubtitleUploadMethod.manual, 'Manual', state, notifier),
                ],
              ),
            ),
            const SizedBox(height: 20),

            if (state.method == SubtitleUploadMethod.ai)
              _buildAiScanMethodView(state, notifier)
            else if (state.method == SubtitleUploadMethod.manual)
              const ManualSubView(),

            if (state.hasSelection) ...[
              const SizedBox(height: 24),
              const ActiveSelectionSection(),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
        color: Colors.white.withOpacity(0.50),
      ),
    );
  }

  Widget _buildMethodPill(
      SubtitleUploadMethod method, String label, SubtitlesUploadState state, SubtitlesUploadNotifier notifier) {
    final isSelected = state.method == method;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          notifier.setMethod(method);
          if (state.rawFiles.isEmpty) {
            notifier.fetchJimakuFiles();
          }
        },
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFF7C3AED), Color(0xFF6366F1), Color(0xFF0EA5E9)],
                  )
                : null,
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Color.fromRGBO(99, 102, 241, 0.45),
                      blurRadius: 22,
                      offset: Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.72),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAiScanMethodView(SubtitlesUploadState state, SubtitlesUploadNotifier notifier) {
    final episodes = state.availableEpisodes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220,
          padding: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black.withOpacity(0.18),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: RawScrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            controller: _aiScrollController,
            thumbColor: const Color(0xFF67E8F9).withOpacity(0.5),
            trackColor: Colors.white.withOpacity(0.05),
            radius: const Radius.circular(8),
            thickness: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                controller: _aiScrollController,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.2,
                ),
                itemCount: episodes.length,
                itemBuilder: (context, index) {
                  final ep = episodes[index];
                  final isSelected = state.selectedEpisode == ep;
                  return InkWell(
                    onTap: () => notifier.selectEpisode(ep),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: isSelected
                            ? const Color(0xFF67E8F9).withOpacity(0.1)
                            : Colors.white.withOpacity(0.06),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF67E8F9) : Colors.white.withOpacity(0.16),
                          width: isSelected ? 2 : 1.2,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF67E8F9).withOpacity(0.18),
                                  blurRadius: 8,
                                )
                              ]
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ep $ep',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                              color: isSelected ? const Color(0xFF67E8F9) : Colors.white.withOpacity(0.72),
                            ),
                          ),
                          if (isSelected) ...[
                            const SizedBox(width: 4),
                            const Text(
                              '✓',
                              style: TextStyle(
                                color: Color(0xFF67E8F9),
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
