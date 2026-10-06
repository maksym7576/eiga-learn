import 'package:flutter/material.dart';

class GeminiIcon extends StatelessWidget {
  const GeminiIcon({super.key, this.size = 30, this.color = Colors.white});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _SparklePainter(color)),
      );
}

class _SparklePainter extends CustomPainter {
  const _SparklePainter(this.color);
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
