import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

/// Кругла "скляна" кнопка (.g в HTML): hover підіймає, press стискає, isOn підсвічує cyan.
class PlayerGlassButton extends StatefulWidget {
  final double size;
  final bool isOn;
  final String tooltip;
  final VoidCallback onPressed;
  final Widget Function(Color color) builder;
  final Color idleColor;

  const PlayerGlassButton({
    Key? key,
    required this.tooltip,
    required this.onPressed,
    required this.builder,
    this.size = 38,
    this.isOn = false,
    this.idleColor = Colors.white,
  }) : super(key: key);

  @override
  State<PlayerGlassButton> createState() => _PlayerGlassButtonState();
}

class _PlayerGlassButtonState extends State<PlayerGlassButton> {
  bool _hover = false;
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final on = widget.isOn;
    final color = on ? AppColors.cyan300 : widget.idleColor;
    final bg = on
        ? AppColors.cyan300.withOpacity(0.18)
        : Colors.white.withOpacity(_hover ? 0.18 : 0.08);
    final border = on
        ? AppColors.cyan300.withOpacity(0.6)
        : (_hover ? Colors.white.withOpacity(0.3) : Colors.transparent);
    const d = Duration(milliseconds: 150);

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
        child: AnimatedSlide(
          offset: Offset(0, _hover ? -2 / widget.size : 0),
          duration: d,
          child: AnimatedScale(
            scale: _down ? 0.92 : 1,
            duration: d,
            child: AnimatedContainer(
              duration: d,
              width: widget.size,
              height: widget.size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bg,
                border: Border.all(color: border, width: 1),
              ),
              child: widget.builder(color),
            ),
          ),
        ),
      ),
    );
  }
}
