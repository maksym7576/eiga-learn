import 'package:flutter/material.dart';

/// Універсальна анімація появи (зсув знизу + прозорість + блокування торкань до появи).
class ButtonEntranceTransition extends StatelessWidget {
  const ButtonEntranceTransition({
    super.key,
    required this.animation,
    required this.child,
    this.slideOffset = 18.0,
    this.ignoreThreshold = 0.6,
  });

  final Animation<double> animation;
  final Widget child;
  final double slideOffset;
  final double ignoreThreshold;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final t = animation.value;
        return IgnorePointer(
          ignoring: t < ignoreThreshold,
          child: Opacity(
            opacity: t.clamp(0.0, 1.0),
            child: Transform.translate(
              offset: Offset(0, slideOffset * (1 - t)),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
