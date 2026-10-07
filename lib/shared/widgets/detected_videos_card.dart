import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Detected-videos card: big number + label.
class DetectedVideosCard extends StatelessWidget {
  final int count;
  final String title; // e.g. "video cards will be deleted"
  final String subtitle; // e.g. "Cached files and subtitles included"
  final String emptyTitle;
  final String emptySubtitle;
  final Color accent;

  const DetectedVideosCard({
    super.key,
    required this.count,
    this.accent = AppColors.cyan300,
    this.title = 'video cards will be deleted',
    this.subtitle = '',
    this.emptyTitle = 'No video cards',
    this.emptySubtitle = 'Nothing else will be affected',
  });

  @override
  Widget build(BuildContext context) {
    final zero = count == 0;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: zero ? Colors.white.withOpacity(0.06) : accent.withOpacity(0.16),
        border: Border.all(
          color: zero ? Colors.white.withOpacity(0.16) : accent.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 34,
            child: Text(
              '$count',
              textAlign: TextAlign.center,
              style: AppTypography.title.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: zero ? Colors.white.withOpacity(0.45) : Colors.white,
                letterSpacing: -0.5,
                height: 1.0,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  zero ? emptyTitle : title,
                  style: AppTypography.title.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                  ),
                ),
                if ((zero ? emptySubtitle : subtitle).isNotEmpty)
                  Text(
                    zero ? emptySubtitle : subtitle,
                    style: AppTypography.title.copyWith(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.85),
                      height: 1.35,
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
