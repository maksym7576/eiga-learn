import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eiga/database/models/word_models.dart';

class AppColors {
  static const bg = Color(0xFF0A0518);
  static const sheet = Color(0xEB0E0A22);
  static const cyan = Color(0xFF67E8F9);
  static const cyanSoft = Color(0xFFA5F3FC);
  static const violet = Color(0xFFA78BFA);
  static const amber = Color(0xFFFBBF24);
  static const amberSoft = Color(0xFFFDE68A);
  static const green = Color(0xFF34D399);
  static const greenSoft = Color(0xFFA7F3D0);
  static const red = Color(0xFFEF4444);
  static const slate = Color(0xFF94A3B8);
  static const pink = Color(0xFFF9A8D4);

  static const accent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0, .55, 1],
    colors: [Color(0xFF7C3AED), Color(0xFF6366F1), Color(0xFF0EA5E9)],
  );

  static Color w(double o) => Colors.white.withValues(alpha: o);

  static Color? status(WordStatus s) => switch (s) {
        WordStatus.unknown => red, // Red for unknown / не знаю
        WordStatus.learning => amber,
        WordStatus.known => green,
        WordStatus.none => null,
      };
}

class AppText {
  static TextStyle ui({
    double size = 14,
    FontWeight weight = FontWeight.w600,
    Color color = Colors.white,
    double? height,
    double? letterSpacing,
  }) =>
      GoogleFonts.plusJakartaSans(
          fontSize: size, fontWeight: weight, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle jp({
    double size = 16,
    FontWeight weight = FontWeight.w700,
    Color color = Colors.white,
    double? height,
  }) =>
      GoogleFonts.mPlusRounded1c(fontSize: size, fontWeight: weight, color: color, height: height);
}
