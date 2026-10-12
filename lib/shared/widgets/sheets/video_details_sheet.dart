import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:eiga/database/models/video.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../buttons/confirm_button.dart';
import 'app_bottom_sheet_mobile.dart';

class VideoDetailsSheet extends StatefulWidget {
  final Video video;
  final VoidCallback onClose;

  const VideoDetailsSheet({
    super.key,
    required this.video,
    required this.onClose,
  });

  static Future<void> show(BuildContext context, Video video) {
    return AppBottomSheetMobile.show(
      context: context,
      heightFactor: 0.88,
      child: VideoDetailsSheet(
        video: video,
        onClose: () => Navigator.pop(context),
      ),
    );
  }

  @override
  State<VideoDetailsSheet> createState() => _VideoDetailsSheetState();
}

class _VideoDetailsSheetState extends State<VideoDetailsSheet> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meta = widget.video.metadata;
    final sync = widget.video.sync;
    final research = widget.video.researchInformation;

    Widget sectionHeader(String title) => Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.cyan300,
                fontSize: 12.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
        );

    Widget row(String label, String? value) {
      if (value == null || value.isEmpty || value == 'null') return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    String fmtDur(int? ms) {
      if (ms == null) return 'N/A';
      final d = Duration(milliseconds: ms);
      final h = d.inHours;
      final m = d.inMinutes % 60;
      final s = d.inSeconds % 60;
      return h > 0 ? '$h h $m m $s s' : '$m m $s s';
    }

    String fmtSize(double? size) {
      if (size == null) return 'N/A';
      if (size < 10.0) return '${size.toStringAsFixed(1)} GB';
      if (size < 10000.0) return '${size.toStringAsFixed(0)} MB';
      const u = ['B', 'KB', 'MB', 'GB', 'TB'];
      var v = size, i = 0;
      while (v >= 1024 && i < u.length - 1) {
        v /= 1024;
        i++;
      }
      return '${v.toStringAsFixed(i == 0 ? 0 : 1)} ${u[i]}';
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      decoration: BoxDecoration(
        color: AppColors.surfaceDialog,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: AppColors.borderStrong, width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const Icon(
            Icons.bar_chart_rounded,
            color: AppColors.cyan300,
            size: 44,
          ),
          const SizedBox(height: 14),
          Text(
            'Details & Statistics',
            style: AppTypography.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            meta.name ?? 'Video Details',
            textAlign: TextAlign.center,
            style: AppTypography.bodySm.copyWith(
              color: Colors.white.withOpacity(0.7),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 380),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionHeader('GENERAL INFORMATION'),
                      row('ID', widget.video.id.toString()),
                      row('Title', meta.name),
                      row('Season', meta.season?.toString()),
                      row('Episode', meta.episode?.toString()),
                      row('Description', meta.description),
                      row('Duration', fmtDur(meta.duration)),
                      row('File Size', fmtSize(meta.size)),
                      row('Cached', widget.video.isCached ? 'Yes' : 'No'),
                      row('Last Position', meta.duration != null && widget.video.lastVideoPosition != null ? '${(widget.video.lastVideoPosition! / 1000).toStringAsFixed(1)}s' : null),

                      sectionHeader('LANGUAGES & PIPELINE'),
                      row('Original Lang', widget.video.originalLanguage),
                      row('Translated Lang', widget.video.translatedLanguage),
                      row('Pipeline ID', widget.video.pipelineIdentifier),
                      row('Pipeline Version', widget.video.pipelineVersion),
                      row('Primary Audio', widget.video.primaryAudio),
                      row('Created At', meta.createdAt?.toLocal().toString()),
                      row('Last Processed', widget.video.lastProcessedAt?.toLocal().toString()),

                      sectionHeader('FILES & PATHS'),
                      row('Video Path', widget.video.videoPath),
                      row('Video File Name', meta.videoFileName),
                      row('Subtitle Path', widget.video.subtitlePath),
                      row('Subtitle File Name', meta.subtitleFileName),
                      row('Cover Image', widget.video.coverImagePath),

                      sectionHeader('METADATA & SOURCES'),
                      row('Metadata Source', meta.metadataSource),
                      row('Source ID', meta.metadataSourceId),
                      row('Subtitle Method', meta.subtitleMethodUsed),
                      row('Subtitle Source ID', meta.subtitleSourceId),
                      row('Video Source', meta.videoSource),

                      if (research != null) ...[
                        sectionHeader('RESEARCH INFORMATION'),
                        row('Research Done', widget.video.isResearchDone ? 'Yes' : 'No'),
                        row('Context', research.context),
                        if (research.glossary.isNotEmpty)
                          row('Glossary', research.glossary.join(', ')),
                      ],

                      sectionHeader('SYNC & METADATA'),
                      row('Sync ID', sync.syncId),
                      row('Owner ID', sync.ownerId),
                      row('Is Synced', sync.isSynced ? 'Yes' : 'No'),
                      row('Is Deleted', sync.isDeleted ? 'Yes' : 'No'),
                      row('Updated At', sync.updatedAt.toLocal().toString()),
                      row('Last Synced At', sync.lastSyncedAt?.toLocal().toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            child: ConfirmButton(
              label: 'Close',
              onTap: widget.onClose,
              accentColor: AppColors.cyan300,
            ),
          ),
        ],
      ),
    );
  }
}
