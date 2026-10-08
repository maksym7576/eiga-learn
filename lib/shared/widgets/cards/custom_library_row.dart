import 'dart:ui' show PathMetric;
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../database/models/word_models.dart';

class CustomItem {
  final String id;
  final String title;
  final String? subtitle;
  final WordStatus status;
  final String? jlpt;
  final String pos;
  final int occurrences;
  final String? note;

  const CustomItem({
    required this.id,
    required this.title,
    this.subtitle,
    required this.status,
    this.jlpt,
    required this.pos,
    required this.occurrences,
    this.note,
  });
}

/// A widget similar to VideoLibraryRow for vocabulary cards with status, extra info, hover, and click animations.
class CustomLibraryRow extends StatelessWidget {
  const CustomLibraryRow({
    super.key,
    required this.items,
    this.title = 'Vocabulary Cards',
    this.totalCount,
    this.onSeeAll,
    this.onItemTap,
    this.t,
  });

  final List<CustomItem> items;
  final String title;
  final int? totalCount;
  final VoidCallback? onSeeAll;
  final ValueChanged<CustomItem>? onItemTap;
  final String Function(String key)? t;

  static const _cardW = 185.0;
  static const _pad = 16.0;

  @override
  Widget build(BuildContext context) {
    final navigateToAll = onSeeAll ?? () {};

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
                onTap: navigateToAll,
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
              _SeeAllPill(onTap: navigateToAll),
            ],
          ),
        ),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _pad),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.white10.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.white10),
              ),
              alignment: Alignment.center,
              child: Text(
                t != null ? t!('empty_card') : 'Empty',
                style: const TextStyle(
                  color: AppColors.white60,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        else
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
                  for (final item in items) ...[
                    CustomCard(
                      item: item,
                      width: _cardW,
                      t: t,
                      onTap: () => onItemTap?.call(item),
                    ),
                    const SizedBox(width: 16),
                  ],
                  _SeeAllCard(
                    width: _cardW,
                    count: totalCount ?? items.length,
                    onTap: navigateToAll,
                    t: t,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.item, required this.onTap, required this.width, this.t});
  final CustomItem item;
  final VoidCallback onTap;
  final double width;
  final String Function(String key)? t;

  @override
  State<CustomCard> createState() => CustomCardState();
}

class CustomCardState extends State<CustomCard> {
  bool _hover = false;
  bool _pressed = false;

  String _statusLabel(WordStatus status) {
    if (widget.t == null) return status.label;
    return switch (status) {
      WordStatus.unknown => widget.t!('status_unknown'),
      WordStatus.learning => widget.t!('status_learning'),
      WordStatus.known => widget.t!('status_known'),
      WordStatus.none => '',
    };
  }

  String _posLabel(String pos) {
    if (widget.t == null) return pos;
    final key = switch (pos.toLowerCase()) {
      'дієслово' || 'verb' => 'pos_verb',
      'іменник' || 'noun' => 'pos_noun',
      'прикметник' || 'adjective' => 'pos_adjective',
      _ => null,
    };
    return key != null ? widget.t!(key) : pos;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (widget.item.status) {
      WordStatus.known => AppColors.emerald500,
      WordStatus.learning => AppColors.amber500,
      WordStatus.unknown => AppColors.danger,
      WordStatus.none => Colors.transparent,
    };

    final occurrencesLabel = widget.t != null ? widget.t!('occurrences') : 'входжень';
    final statusText = _statusLabel(widget.item.status);
    final posText = _posLabel(widget.item.pos);

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: widget.width,
          height: 155,
          transform: Matrix4.translationValues(0.0, _hover ? -6.0 : 0.0, 0.0)
            ..scale(_pressed ? 0.96 : 1.0),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _hover ? const Color(0xEB1E1440) : const Color.fromRGBO(12, 8, 30, .78),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _hover ? const Color(0xFF67E8F9) : AppColors.white20,
              width: _hover ? 1.5 : 1.0,
            ),
            boxShadow: [
              if (_hover)
                const BoxShadow(
                  color: Color.fromRGBO(103, 232, 249, 0.25),
                  blurRadius: 20,
                  spreadRadius: -4,
                  offset: Offset(0, 8),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.item.status != WordStatus.none)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: statusColor.withValues(alpha: 0.6)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            statusText,
                            style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox(),
                  if (widget.item.jlpt != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA78BFA).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFA78BFA).withValues(alpha: 0.5)),
                      ),
                      child: Text(
                        widget.item.jlpt!,
                        style: const TextStyle(color: Color(0xFFA78BFA), fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -.3,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.item.subtitle ?? '',
                    style: const TextStyle(
                      color: AppColors.cyan300,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.movie_outlined, size: 12, color: AppColors.white60),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.item.occurrences} $occurrencesLabel',
                    style: const TextStyle(color: AppColors.white60, fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    posText,
                    style: const TextStyle(color: AppColors.white60, fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
  const _SeeAllCard({required this.width, required this.count, this.onTap, this.t});
  final double width;
  final int count;
  final VoidCallback? onTap;
  final String Function(String key)? t;

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
        height: 155,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.identity()..translate(0.0, _hover ? -6.0 : 0.0),
            child: CustomPaint(
              painter: _DashedRRect(
                radius: 18,
                color: _hover ? const Color(0xFF67E8F9) : const Color.fromRGBO(196, 181, 253, .6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: _hover ? const Color(0xEB1E1440) : const Color.fromRGBO(12, 8, 30, .78),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
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
                      child: const Icon(Icons.arrow_forward_rounded, size: 22, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('${widget.count} words', style: const TextStyle(fontSize: 11, color: AppColors.white60)),
                  ],
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
