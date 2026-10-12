import 'package:flutter/material.dart';

class LayerStyle {
  final double fontSize;
  final double letterSpacing;
  final double thickness; // th: 0.0 .. 1.0
  final double outlineWidth;
  final Color color;
  final Color outlineColor;
  final double topGap;
  final TextAlign alignment;

  const LayerStyle({
    this.fontSize = 16.0,
    this.letterSpacing = 0.0,
    this.thickness = 0.5,
    this.outlineWidth = 1.0,
    this.color = Colors.white,
    this.outlineColor = Colors.black,
    this.topGap = 4.0,
    this.alignment = TextAlign.left,
  });

  LayerStyle copyWith({
    double? fontSize,
    double? letterSpacing,
    double? thickness,
    double? outlineWidth,
    Color? color,
    Color? outlineColor,
    double? topGap,
    TextAlign? alignment,
  }) {
    return LayerStyle(
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      thickness: thickness ?? this.thickness,
      outlineWidth: outlineWidth ?? this.outlineWidth,
      color: color ?? this.color,
      outlineColor: outlineColor ?? this.outlineColor,
      topGap: topGap ?? this.topGap,
      alignment: alignment ?? this.alignment,
    );
  }
}
