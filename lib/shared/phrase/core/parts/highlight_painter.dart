import 'package:flutter/material.dart';

class HighlightPainter extends CustomPainter {
  final List<Rect> rects;
  final Color color;
  final double radius;

  HighlightPainter({
    required this.rects,
    required this.color,
    this.radius = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (final rect in rects) {
      final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant HighlightPainter oldDelegate) {
    return oldDelegate.rects != rects || oldDelegate.color != color;
  }
}
