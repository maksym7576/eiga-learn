import 'package:flutter/material.dart';
import '../logo/mini_app_logo.dart';

/// Синій/фіолетовий фон обкладинки, коли немає фото, з адаптивним логотипом "eigあ" по центру.
class CoverPlaceholder extends StatelessWidget {
  const CoverPlaceholder({
    super.key,
    this.showLogo = true,
    this.logoSize,
  });

  final bool showLogo;
  final double? logoSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // Стандарт базується на ширині VideoCard (~175px -> logoSize 48.0)
        final proportionalSize = width * 0.30;
        final effectiveLogoSize = logoSize ?? proportionalSize.clamp(14.0, 48.0);

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.5, -0.8),
              end: Alignment(0.5, 0.8),
              colors: [Color(0xFF150A2E), Color(0xFF0B0620)],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              // Radial gradient top-left (25% 20%)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.5, -0.6),
                    radius: 0.8,
                    colors: [Color.fromRGBO(124, 58, 237, .55), Color.fromRGBO(124, 58, 237, 0)],
                    stops: [0, 0.55],
                  ),
                ),
              ),
              // Radial gradient bottom-right (80% 85%)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0.6, 0.7),
                    radius: 0.8,
                    colors: [Color.fromRGBO(14, 165, 233, .45), Color.fromRGBO(14, 165, 233, 0)],
                    stops: [0, 0.55],
                  ),
                ),
              ),
              // Dots grid pattern
              const CustomPaint(painter: _DotsPainter()),
              // Logo in center (авто-масштабування з урахуванням стандарту VideoCard)
              if (showLogo)
                Center(
                  child: Opacity(
                    opacity: 0.9,
                    child: MiniAppLogo(size: effectiveLogoSize),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _DotsPainter extends CustomPainter {
  const _DotsPainter();

  @override
  bool shouldRepaint(covariant _DotsPainter oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = const Color.fromRGBO(255, 255, 255, .07);
    const step = 14.0;
    for (double y = 0; y < size.height; y += step) {
      for (double x = 0; x < size.width; x += step) {
        canvas.drawCircle(Offset(x, y), 0.6, p);
      }
    }
  }
}
