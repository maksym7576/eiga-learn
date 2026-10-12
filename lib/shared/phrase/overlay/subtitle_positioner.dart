import 'package:flutter/material.dart';

class SubtitlePositioner extends StatelessWidget {
  final double verticalOffset; // vo: 0.0 .. 1.0 (наприклад 0.05 = 5% від низу)
  final Widget child;

  const SubtitlePositioner({
    super.key,
    required this.verticalOffset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, 1.0 - (verticalOffset * 2.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: child,
      ),
    );
  }
}
