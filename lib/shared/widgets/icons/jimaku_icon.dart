import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class JimakuIcon extends StatelessWidget {
  const JimakuIcon({super.key, this.size = 30, this.color = AppColors.cyan300});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _SubtitlePainter(color)),
      );
}

class _SubtitlePainter extends CustomPainter {
  const _SubtitlePainter(this.color);
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
