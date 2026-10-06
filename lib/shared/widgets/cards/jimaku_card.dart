import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../providers/services_providers.dart';
import 'service_card.dart';

/// Картка Jimaku (Recommended).
class JimakuCard extends ConsumerWidget {
  const JimakuCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tag,
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String tag;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasTokenAsync = ref.watch(hasTokenProvider('jimaku'));
    final hasToken = hasTokenAsync.asData?.value ?? false;

    return ServiceCard(
      hasToken: hasToken,
      isSelected: isSelected,
      title: title,
      subtitle: subtitle,
      tag: tag,
      tagStyle: ServiceTagStyle.accent,
      icon: const SizedBox(
        width: 24,
        height: 24,
        child: CustomPaint(painter: _SubtitlePainter(color: AppColors.cyan300)),
      ),
      onTap: onTap,
    );
  }
}

/// Прямокутник із рядками субтитрів (viewBox 24x24, stroke 2).
class _SubtitlePainter extends CustomPainter {
  const _SubtitlePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final k = size.width / 24;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 * k
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(3 * k, 5 * k, 18 * k, 14 * k),
        Radius.circular(3 * k),
      ),
      paint,
    );

    final lines = Path()
      ..moveTo(7 * k, 11 * k)
      ..lineTo(11 * k, 11 * k)
      ..moveTo(13 * k, 11 * k)
      ..lineTo(17 * k, 11 * k)
      ..moveTo(7 * k, 15 * k)
      ..lineTo(14 * k, 15 * k);
    canvas.drawPath(lines, paint);
  }

  @override
  bool shouldRepaint(_SubtitlePainter old) => old.color != color;
}
