import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/services_providers.dart';
import 'service_card.dart';

/// Картка Gemini (Required).
class GeminiCard extends ConsumerWidget {
  const GeminiCard({
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
    final hasTokenAsync = ref.watch(hasTokenProvider('gemini'));
    final hasToken = hasTokenAsync.asData?.value ?? false;

    return ServiceCard(
      hasToken: hasToken,
      isSelected: isSelected,
      title: title,
      subtitle: subtitle,
      tag: tag,
      tagStyle: ServiceTagStyle.neutral,
      icon: const SizedBox(
        width: 24,
        height: 24,
        child: CustomPaint(painter: _SparklePainter(color: Colors.white)),
      ),
      onTap: onTap,
    );
  }
}

/// Зірка-sparkle (viewBox 24x24).
class _SparklePainter extends CustomPainter {
  const _SparklePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final k = size.width / 24;
    final p = Path()
      ..moveTo(12 * k, 2 * k)
      ..cubicTo(12.6 * k, 7.4 * k, 16.6 * k, 11.4 * k, 22 * k, 12 * k)
      ..cubicTo(16.6 * k, 12.6 * k, 12.6 * k, 16.6 * k, 12 * k, 22 * k)
      ..cubicTo(11.4 * k, 16.6 * k, 7.4 * k, 12.6 * k, 2 * k, 12 * k)
      ..cubicTo(7.4 * k, 11.4 * k, 11.4 * k, 7.4 * k, 12 * k, 2 * k)
      ..close();
    canvas.drawPath(p, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SparklePainter old) => old.color != color;
}
