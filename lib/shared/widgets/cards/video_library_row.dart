import 'dart:ui' show PathMetric;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import 'video_card.dart';
import 'video_item.dart';

/// Бокс "Library": заголовок + "See all" + горизонтальна стрічка карток,
/// в кінці — картка "See all".
class VideoLibraryRow extends StatelessWidget {
  const VideoLibraryRow({
    super.key,
    required this.videos,
    this.title = 'Library',
    this.totalCount,
    this.onSeeAll,
    this.onVideoTap,
    this.onMenuAction,
  });

  final List<VideoItem> videos;
  final String title;

  /// Для підпису "24 videos" на останній картці. За замовчуванням = videos.length.
  final int? totalCount;
  final VoidCallback? onSeeAll;
  final ValueChanged<VideoItem>? onVideoTap;
  final void Function(VideoItem video, VideoMenuAction action)? onMenuAction;

  static const _cardW = 175.0;
  static const _gap = 16.0;
  static const _pad = 16.0;

  @override
  Widget build(BuildContext context) {
    final navigateToLibrary = onSeeAll ?? () => context.go('/library');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(_pad, 0, _pad, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: navigateToLibrary,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -.3,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              _SeeAllPill(onTap: navigateToLibrary),
            ],
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (r) => LinearGradient(
            colors: const [Color(0x00000000), Colors.black, Colors.black, Color(0x00000000)],
            stops: [0, 12 / r.width, 1 - 28 / r.width, 1],
          ).createShader(r),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.fromLTRB(_pad, 8, _pad, 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final v in videos) ...[
                  VideoCard(
                    video: v,
                    width: _cardW,
                    onTap: () => onVideoTap?.call(v),
                    onMenuAction: (a) => onMenuAction?.call(v, a),
                  ),
                  const SizedBox(width: _gap),
                ],
                _SeeAllCard(width: _cardW, count: totalCount ?? videos.length, onTap: navigateToLibrary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SeeAllPill extends StatefulWidget {
  const _SeeAllPill({this.onTap});
  final VoidCallback? onTap;

  @override
  State<_SeeAllPill> createState() => _SeeAllPillState();
}

class _SeeAllPillState extends State<_SeeAllPill> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Material(
        color: _hover ? const Color(0x2638BDF8) : AppColors.white10,
        shape: StadiumBorder(
          side: BorderSide(
            color: _hover ? const Color(0xFF67E8F9) : const Color.fromRGBO(255, 255, 255, .24),
            width: 1.5,
          ),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: widget.onTap,
          child: const Padding(
            padding: EdgeInsets.only(left: 16, right: 10),
            child: SizedBox(
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('See all', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.cyanLight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SeeAllCard extends StatefulWidget {
  const _SeeAllCard({required this.width, required this.count, this.onTap});
  final double width;
  final int count;
  final VoidCallback? onTap;

  @override
  State<_SeeAllCard> createState() => _SeeAllCardState();
}

class _SeeAllCardState extends State<_SeeAllCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: SizedBox(
        width: widget.width,
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              transform: Matrix4.identity()..translate(0.0, _hover ? -6.0 : 0.0),
              child: CustomPaint(
                painter: _DashedRRect(
                  radius: 16,
                  color: _hover ? const Color(0xFF67E8F9) : const Color.fromRGBO(196, 181, 253, .6),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: _hover ? const Color(0xEB1E1440) : const Color.fromRGBO(12, 8, 30, .72),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color.fromRGBO(255, 255, 255, .4)),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFF7C3AED), Color(0xFF6366F1), Color(0xFF38BDF8)],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(99, 102, 241, .9),
                              blurRadius: 28,
                              spreadRadius: -6,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.arrow_forward_rounded, size: 28, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -.3,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text('${widget.count} videos', style: const TextStyle(fontSize: 12, color: AppColors.white60)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedRRect extends CustomPainter {
  _DashedRRect({required this.radius, required this.color});
  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          (Offset.zero & size).deflate(1), Radius.circular(radius)));
    for (final PathMetric m in path.computeMetrics()) {
      double d = 0;
      while (d < m.length) {
        canvas.drawPath(m.extractPath(d, d + 6), paint);
        d += 10;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRect old) => old.color != color || old.radius != radius;
}
