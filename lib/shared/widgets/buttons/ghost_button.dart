import 'package:flutter/material.dart';

/// «Привидна» кнопка: прозора, поки не наведеш (hover) або не сфокусуєш.
/// На hover з'являються фон і рамка, кнопка піднімається на 2px,
/// при натисканні стискається до 95%.
class GhostButton extends StatefulWidget {
  const GhostButton({
    super.key,
    required this.builder,
    required this.onPressed,
    this.tooltip,
    this.size = 40,
    this.padding = EdgeInsets.zero,
  });

  /// Контент; [hovered] можна використати для анімації іконки.
  final Widget Function(BuildContext context, bool hovered) builder;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final EdgeInsetsGeometry padding;

  @override
  State<GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
  bool _hover = false;
  bool _focus = false;
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Widget w = FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (v) => setState(() => _hover = v),
      onShowFocusHighlight: (v) => setState(() => _focus = v),
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onPressed?.call();
            return null;
          },
        ),
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onPressed,
        onTapDown: (_) => setState(() => _down = true),
        onTapUp: (_) => setState(() => _down = false),
        onTapCancel: () => setState(() => _down = false),
        child: AnimatedScale(
          scale: _down ? .95 : 1,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform:
                Matrix4.translationValues(0, _hover && !_down ? -2 : 0, 0),
            height: widget.size,
            constraints: BoxConstraints(minWidth: widget.size),
            padding: widget.padding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _hover ? Colors.white.withOpacity(.13) : Colors.transparent,
              borderRadius: BorderRadius.circular(widget.size / 2),
              border: Border.all(
                width: 1.5,
                color: _focus
                    ? cs.primary
                    : _hover
                        ? Colors.white.withOpacity(.32)
                        : Colors.transparent,
              ),
            ),
            child: IconTheme(
              data: IconThemeData(color: Colors.white.withOpacity(.9)),
              child: DefaultTextStyle.merge(
                style: TextStyle(color: Colors.white.withOpacity(.9)),
                child: widget.builder(context, _hover),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      w = Tooltip(message: widget.tooltip!, child: w);
    }
    return Semantics(button: true, label: widget.tooltip, child: w);
  }
}
