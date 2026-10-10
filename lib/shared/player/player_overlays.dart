import 'dart:ui' show PointMode;
import 'package:flutter/material.dart';

/// Фон-заглушка, коли немає відео (.video в HTML).
class PlayerPlaceholderVideo extends StatelessWidget {
  const PlayerPlaceholderVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.35, -1),
              end: Alignment(0.35, 1),
              stops: [0, 0.55, 1],
              colors: [Color(0xFF1E3A8A), Color(0xFF0E7490), Color(0xFF0B1D2A)],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-0.5, -0.5),
              radius: 0.84,
              colors: [Color(0x737C3AED), Color(0x007C3AED)],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.6, 0.7),
              radius: 0.91,
              colors: [Color(0x660EA5E9), Color(0x000EA5E9)],
            ),
          ),
        ),
        RepaintBoundary(child: CustomPaint(painter: _DotsPainter())),
      ],
    );
  }
}

class _DotsPainter extends CustomPainter {
  const _DotsPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final pts = <Offset>[];
    for (double x = 0; x < size.width; x += 14) {
      for (double y = 0; y < size.height; y += 14) {
        pts.add(Offset(x, y));
      }
    }
    canvas.drawPoints(
      PointMode.points,
      pts,
      Paint()
        ..color = Colors.white.withOpacity(0.06)
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant _DotsPainter old) => false;
}

/// Центральна кнопка play/pause (.hero).
class PlayerHeroButton extends StatefulWidget {
  final bool isPlaying;
  final bool isFullScreen;
  final VoidCallback onPressed;

  const PlayerHeroButton({
    Key? key,
    required this.isPlaying,
    required this.isFullScreen,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PlayerHeroButton> createState() => _PlayerHeroButtonState();
}

class _PlayerHeroButtonState extends State<PlayerHeroButton> {
  bool _hover = false;
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final size = widget.isFullScreen ? 72.0 : 64.0;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _down = true),
        onTapUp: (_) => setState(() => _down = false),
        onTapCancel: () => setState(() => _down = false),
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _down ? 0.94 : (_hover ? 1.08 : 1),
          duration: const Duration(milliseconds: 250),
          curve: const Cubic(0.2, 0.9, 0.3, 1.2),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2563EB), Color(0xFF0EA5E9), Color(0xFF38BDF8)],
                stops: [0, 0.5, 1],
              ),
              border: Border.all(color: Colors.white.withOpacity(0.45), width: 1),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0EA5E9).withOpacity(0.9),
                  blurRadius: 30,
                  spreadRadius: -6,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              widget.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

/// Фідбек подвійного тапу: ∓10 с (.dt в HTML). Спрацьовує при зміні [trigger].
class PlayerSkipFeedback extends StatefulWidget {
  final bool left;
  final int trigger;

  const PlayerSkipFeedback({Key? key, required this.left, required this.trigger})
      : super(key: key);

  @override
  State<PlayerSkipFeedback> createState() => _PlayerSkipFeedbackState();
}

class _PlayerSkipFeedbackState extends State<PlayerSkipFeedback>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

  @override
  void didUpdateWidget(covariant PlayerSkipFeedback old) {
    super.didUpdateWidget(old);
    if (widget.trigger != old.trigger) _c.forward(from: 0);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: widget.left ? Alignment.centerLeft : Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.32,
          heightFactor: 1,
          child: AnimatedBuilder(
            animation: _c,
            builder: (context, _) {
              final t = _c.value;
              final opacity = t < 0.25 ? t / 0.25 : 1 - (t - 0.25) / 0.75;
              final scale = t < 0.25 ? 0.8 + 0.2 * (t / 0.25) : 1.0;
              return Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 0.8,
                        colors: [Colors.white.withOpacity(0.22), Colors.white.withOpacity(0)],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.flip(
                          flipX: !widget.left,
                          child: const Icon(Icons.replay, color: Colors.white, size: 30),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.left ? '−10 с' : '+10 с',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
