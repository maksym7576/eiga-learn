import 'package:flutter/material.dart';

/// Градієнтний слайдер (.seek в HTML). Використовується і для seek, і для гучності.
class PlayerSlider extends StatefulWidget {
  final double value; // 0..1
  final ValueChanged<double> onChanged; // 0..1
  final VoidCallback? onChangeStart;
  final VoidCallback? onChangeEnd;

  const PlayerSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  State<PlayerSlider> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends State<PlayerSlider> {
  bool _hover = false;
  bool _drag = false;

  static const _gradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF06B6D4), Color(0xFF38BDF8)],
  );

  void _end() {
    if (!_drag) return;
    setState(() => _drag = false);
    widget.onChangeEnd?.call();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final w = c.maxWidth;
      final v = widget.value.clamp(0.0, 1.0).toDouble();
      void update(Offset p) => widget.onChanged((p.dx / w).clamp(0.0, 1.0).toDouble());
      final trackH = (_hover || _drag) ? 6.0 : 4.0;

      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: Listener(
          onPointerDown: (e) {
            setState(() => _drag = true);
            widget.onChangeStart?.call();
            update(e.localPosition);
          },
          onPointerMove: (e) {
            if (_drag) update(e.localPosition);
          },
          onPointerUp: (_) => _end(),
          onPointerCancel: (_) => _end(),
          // порожній onTap, щоб зовнішній жест (toggle controls) не спрацьовував
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: SizedBox(
              height: 28,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      height: trackH,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: v,
                          heightFactor: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: _gradient,
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF0EA5E9).withOpacity(0.7),
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: w * v - 7,
                    top: 7,
                    child: IgnorePointer(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
