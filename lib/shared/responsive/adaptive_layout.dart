import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final double breakpoint;

  const AdaptiveLayout({
    Key? key,
    required this.mobile,
    required this.desktop,
    this.breakpoint = 900.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= breakpoint) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
