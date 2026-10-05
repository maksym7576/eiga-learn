import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient textIcon = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.textTop, AppColors.textBottom],
    stops: [0.25, 0.80],
  );

  static const LinearGradient textWhite = LinearGradient(
    colors: [Colors.white, Colors.white],
  );

  // ---- Фони ----
  static const LinearGradient bgBase = LinearGradient(
    begin: Alignment(-0.6, -1),
    end: Alignment(0.6, 1),
    colors: [Color(0xFF1D0D45), AppColors.iconInk, Color(0xFF1A1058)],
    stops: [0.0, 0.45, 1.0],
  );

  static const RadialGradient vignette = RadialGradient(
    radius: 1.1,
    colors: [Color(0x00000000), Color(0x8C0C051E)],
    stops: [0.45, 1.0],
  );

  static RadialGradient blob(Color color, {double opacity = 0.9}) {
    return RadialGradient(
      colors: [color.withOpacity(opacity), color.withOpacity(0)],
    );
  }

  static const LinearGradient button = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.iconPurple, AppColors.iconIndigo, AppColors.iconTeal],
    stops: [0.0, 0.55, 1.0],
  );

  static const LinearGradient glassCard = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xCC1B1050), Color(0xCC0C081E)],
  );
}