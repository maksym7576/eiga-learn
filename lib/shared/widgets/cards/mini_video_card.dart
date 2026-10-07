import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../backgrounds/cover_placeholder.dart';
import 'glass_surface.dart';

class MiniVideoData {
  final String title;
  final String tag; // "≈ 1.4 GB"
  final ImageProvider? cover;

  const MiniVideoData({
    required this.title,
    required this.tag,
    this.cover,
  });
}

class MiniVideoCard extends StatelessWidget {
  final MiniVideoData video;
  final Color accent;
  final int index; // picks a fallback cover gradient

  const MiniVideoCard({
    super.key,
    required this.video,
    this.accent = AppColors.cyan300,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 66,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: video.cover == null
                  ? const CoverPlaceholder()
                  : Image(image: video.cover!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  video.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.title.copyWith(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: accent.withOpacity(0.55)),
                  ),
                  child: Text(
                    video.tag,
                    style: AppTypography.caption.copyWith(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
