import 'dart:io';
import 'package:flutter/material.dart';
import 'package:eiga/shared/widgets/backgrounds/cover_placeholder.dart';
import 'package:eiga/features/upload/domain/models/match_models.dart';

/// Card for displaying a search result in Media Match (Step 2).
/// Features 3:4 aspect ratio cover, title, episode count, provider badge, selection animation,
/// and support for both network image URLs and local file paths.
/// Year is omitted as per specification.
class MatchResultCard extends StatefulWidget {
  final MatchMediaItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;

  const MatchResultCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    this.width = 175,
  });

  @override
  State<MatchResultCard> createState() => _MatchResultCardState();
}

class _MatchResultCardState extends State<MatchResultCard> {
  bool _pressed = false;
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final isSel = widget.isSelected;

    return SizedBox(
      width: widget.width,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          child: AnimatedScale(
            scale: _pressed ? 0.98 : 1.0,
            duration: const Duration(milliseconds: 120),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(
                  0.0,
                  _pressed ? 0.0 : ((_hover || isSel) ? -6.0 : 0.0),
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCover(item, isSel),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (item.episodes != null) ...[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'EP ${item.episodes}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.4,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                            ],
                            Flexible(
                              child: Text(
                                item.providerName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.60),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCover(MatchMediaItem item, bool isSel) {
    final activeBorder = (_hover || isSel);
    final imagePathOrUrl = item.rawMetadata?.imagePath ?? item.coverUrl;

    return AspectRatio(
      aspectRatio: 3 / 4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: activeBorder
                ? const Color(0xFF67E8F9)
                : Colors.white.withOpacity(0.20),
            width: activeBorder ? 2.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: activeBorder
                  ? const Color(0x8038BDF8)
                  : const Color.fromRGBO(0, 0, 0, 0.75),
              blurRadius: activeBorder ? 36 : 24,
              spreadRadius: activeBorder ? -4 : -8,
              offset: Offset(0, activeBorder ? 16 : 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Cover image (network or file) or gradient placeholder
              if (imagePathOrUrl != null && imagePathOrUrl.isNotEmpty)
                _buildImage(imagePathOrUrl)
              else
                _buildGradientPlaceholder(item),

              // Bottom shadow overlay
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      Color.fromRGBO(0, 0, 0, 0.20),
                      Color.fromRGBO(0, 0, 0, 0.70),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),

              // Selection checkmark badge
              if (isSel)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(10, 5, 24, 0.55),
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(16, 185, 129, 0.7),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
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

  Widget _buildGradientPlaceholder(MatchMediaItem item) {
    if (item.coverGradient != null && item.coverGradient!.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: item.coverGradient!,
          ),
        ),
        alignment: Alignment.center,
        child: const CoverPlaceholder(),
      );
    }
    return const CoverPlaceholder();
  }
}
