import 'dart:io';
import 'package:flutter/material.dart';
import '../backgrounds/cover_placeholder.dart';

class VideoConfirmInfoCard extends StatelessWidget {
  const VideoConfirmInfoCard({
    super.key,
    required this.title,
    required this.tag,
    this.coverUrl,
    this.isMovie = true,
    this.tagColor,
  });

  final String title;
  final String tag;
  final String? coverUrl;
  final bool isMovie;
  final Color? tagColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.16)),
      ),
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
              child: coverUrl != null && coverUrl!.isNotEmpty
                  ? _buildImage(coverUrl!)
                  : const CoverPlaceholder(),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    if (isMovie) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'MOVIE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: .4,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: (tagColor ?? const Color(0xFF38BDF8)).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: (tagColor ?? const Color(0xFF38BDF8)).withOpacity(0.55)),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String pathOrUrl) {
    if (pathOrUrl.startsWith('http://') || pathOrUrl.startsWith('https://')) {
      return Image.network(
        pathOrUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const CoverPlaceholder(),
      );
    }
    final file = File(pathOrUrl);
    if (file.existsSync()) {
      return Image.file(
        file,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const CoverPlaceholder(),
      );
    }
    return const CoverPlaceholder();
  }
}
