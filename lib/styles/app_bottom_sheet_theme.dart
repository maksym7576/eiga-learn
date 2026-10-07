import 'package:flutter/material.dart';

class AppBottomSheetTheme {
  final Color barrierColor;
  final Duration transitionDuration;
  final Duration snapDuration;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final List<BoxShadow> shadow;
  final EdgeInsets handlePadding;
  final double handleWidth;
  final double handleHeight;
  final Color handleColor;
  final double handleRadius;

  const AppBottomSheetTheme({
    this.barrierColor = const Color(0x99000000),
    this.transitionDuration = const Duration(milliseconds: 300),
    this.snapDuration = const Duration(milliseconds: 250),
    this.backgroundColor = const Color(0xF50E0A22),
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(28)),
    this.shadow = const [
      BoxShadow(
        color: Color(0x99000000),
        blurRadius: 40,
        spreadRadius: -10,
        offset: Offset(0, -10),
      ),
    ],
    this.handlePadding = const EdgeInsets.symmetric(vertical: 12),
    this.handleWidth = 40,
    this.handleHeight = 4,
    this.handleColor = const Color(0x66FFFFFF),
    this.handleRadius = 2,
  });

  static AppBottomSheetTheme of(BuildContext context) {
    return const AppBottomSheetTheme();
  }
}
