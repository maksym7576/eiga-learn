import 'dart:io';
import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'package:eiga/shared/widgets/backgrounds/cover_placeholder.dart';
import 'package:eiga/shared/widgets/cards/processing_overlay.dart';
import 'package:eiga/shared/widgets/cards/video_item.dart';
import 'package:eiga/shared/widgets/cards/video_kebab_menu.dart';

/// Сама відео-картка: обкладинка 3:4, бейдж "JA → UK", прогрес, галочка cached,
/// назва, EP (лише якщо є), дата і меню "три крапки".
class VideoCard extends StatefulWidget {
  const VideoCard({
    super.key,
    required this.video,
    this.onTap,
    this.onMenuAction,
    this.width = 175,
  });

  final VideoItem video;
  final VoidCallback? onTap;
  final ValueChanged<VideoMenuAction>? onMenuAction;
  final double width;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool _pressed = false;
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final v = widget.video;

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
            scale: _pressed ? .98 : 1,
            duration: const Duration(milliseconds: 120),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(0.0, _pressed ? 0.0 : (_hover ? -6.0 : 0.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCover(v),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                v.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700, height: 1.2, color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  if (v.episode != null) ...[
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.white15,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text('EP ${v.episode}',
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: .4,
                                              color: Colors.white)),
                                    ),
                                    const SizedBox(width: 6),
                                  ],
                                  Flexible(
                                    child: Text(v.date,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(4, 0),
                        child: VideoKebabMenu(
                          video: v,
                          onSelected: (a) => widget.onMenuAction?.call(a),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCover(VideoItem v) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hover ? const Color(0xFF67E8F9) : AppColors.white20,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _hover ? const Color(0x8038BDF8) : const Color.fromRGBO(0, 0, 0, .75),
              blurRadius: _hover ? 44 : 34,
              spreadRadius: _hover ? -8 : -12,
              offset: Offset(0, _hover ? 20 : 14),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.5),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // фото (network або file) або синя заглушка з логотипом
              if (v.coverUrl != null && v.coverUrl!.isNotEmpty)
                _buildImage(v.coverUrl!)
              else
                const CoverPlaceholder(),

              // градієнт знизу
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00000000), Color.fromRGBO(0, 0, 0, .10), Color.fromRGBO(0, 0, 0, .60)],
                    stops: [0, .5, 1],
                  ),
                ),
              ),

              // прогрес
              if (v.stage != null) ProcessingOverlay(stage: v.stage!, progress: v.progress),

              // cached
              if (v.cached)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Color.fromRGBO(10, 5, 24, .55), spreadRadius: 2),
                        BoxShadow(color: Color.fromRGBO(16, 185, 129, .7), blurRadius: 12, offset: Offset(0, 4)),
                      ],
                    ),
                    child: const Icon(Icons.check_rounded, size: 15, color: Colors.white),
                  ),
                ),

              // JA → UK
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, .60),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromRGBO(255, 255, 255, .25)),
                  ),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(text: '${v.sourceLang.toUpperCase()} '),
                      const TextSpan(text: '→', style: TextStyle(color: AppColors.cyanLight)),
                      TextSpan(text: ' ${v.targetLang.toUpperCase()}'),
                    ]),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: .5, color: Colors.white),
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
}
