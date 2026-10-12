import 'package:flutter/material.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';

class ActivePhraseBackground extends StatefulWidget {
  final bool isActive;
  final WordColors colors;
  final VoidCallback? onTap;
  final Widget child;

  const ActivePhraseBackground({
    super.key,
    required this.isActive,
    required this.colors,
    this.onTap,
    required this.child,
  });

  @override
  State<ActivePhraseBackground> createState() => _ActivePhraseBackgroundState();
}

class _ActivePhraseBackgroundState extends State<ActivePhraseBackground> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        onHighlightChanged: (pressed) {
          setState(() {
            _isPressed = pressed;
          });
        },
        splashColor: widget.colors.activeAccentColor.withOpacity(0.2),
        highlightColor: widget.colors.activeAccentColor.withOpacity(0.1),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _isPressed
                ? widget.colors.activeAccentColor.withOpacity(0.15)
                : (widget.isActive ? widget.colors.activeFillColor : Colors.transparent),
            border: Border(
              left: BorderSide(
                color: widget.isActive ? widget.colors.activeAccentColor : Colors.transparent,
                width: 3.0,
              ),
            ),
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: widget.isActive ? 1.0 : 0.75,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
