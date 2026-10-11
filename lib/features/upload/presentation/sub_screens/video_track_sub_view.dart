import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

class VideoTrackSubView extends StatelessWidget {
  final List<Map<String, String>> subtitleTracks;
  final int? selectedSubtitle;
  final ValueChanged<int>? onSubtitleSelected;

  const VideoTrackSubView({
    super.key,
    this.subtitleTracks = const [],
    this.selectedSubtitle,
    this.onSubtitleSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (subtitleTracks.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.black.withOpacity(0.2),
          border: Border.all(color: Colors.white.withOpacity(0.16), width: 1.5),
        ),
        child: Column(
          children: [
            Icon(Icons.video_library_outlined, size: 36, color: Colors.white.withOpacity(0.4)),
            const SizedBox(height: 12),
            Text(
              'No embedded subtitle tracks found in the video',
              style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < subtitleTracks.length; i++)
          Padding(
            padding: EdgeInsets.only(top: i == 0 ? 0 : 6),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onSubtitleSelected == null ? null : () => onSubtitleSelected!(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: selectedSubtitle == i ? AppColors.cyan300.withOpacity(0.14) : AppColors.surfaceSubtle,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selectedSubtitle == i ? AppColors.borderHover : AppColors.borderDefault,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
                      child: Icon(Icons.subtitles, size: 16, color: selectedSubtitle == i ? AppColors.cyan300 : Colors.white.withOpacity(0.5)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subtitleTracks[i]['t'] ?? 'Track ${i + 1}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            (subtitleTracks[i]['l'] ?? 'und').toUpperCase(),
                            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11, height: 1.25, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    if (selectedSubtitle == i)
                      const Icon(Icons.check, size: 18, color: AppColors.cyan300),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
