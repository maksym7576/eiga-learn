import 'package:flutter/material.dart';
import 'app_colors.dart';

class ConfirmAccent {
  final List<Color> banner;
  final Gradient gradient;
  final Color c1;
  final Color c2;

  const ConfirmAccent({
    required this.banner,
    required this.gradient,
    required this.c1,
    required this.c2,
  });

  static const violet = ConfirmAccent(
    banner: [Color(0xFF7C3AED), Color(0xFF38BDF8), Color(0xFF4C1D95)],
    gradient: LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFF38BDF8)]),
    c1: Color(0xFF7C3AED),
    c2: Color(0xFF38BDF8),
  );

  static const danger = ConfirmAccent(
    banner: [Color(0xFF7C3AED), Color(0xFFF43F5E), Color(0xFF4C1D95)],
    gradient: LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFFF43F5E)]),
    c1: Color(0xFF7C3AED),
    c2: Color(0xFFF43F5E),
  );

  static const cacheAccent = ConfirmAccent(
    banner: [Color(0xFF312E81), Color(0xFF6366F1), Color(0xFF38BDF8)],
    gradient: LinearGradient(colors: [Color(0xFF38BDF8), Color(0xFF6366F1)]),
    c1: Color(0xFF38BDF8),
    c2: Color(0xFF6366F1),
  );

  static const translateAccent = ConfirmAccent(
    banner: [Color(0xFF4C1D95), Color(0xFF7C3AED), Color(0xFFF472B6)],
    gradient: LinearGradient(colors: [Color(0xFFA78BFA), Color(0xFFF472B6)]),
    c1: Color(0xFFA78BFA),
    c2: Color(0xFFF472B6),
  );

  static const createSubtitlesAccent = ConfirmAccent(
    banner: [Color(0xFF134E4A), Color(0xFF0D9488), Color(0xFF22D3EE)],
    gradient: LinearGradient(colors: [Color(0xFF22D3EE), Color(0xFF2DD4BF)]),
    c1: Color(0xFF22D3EE),
    c2: Color(0xFF2DD4BF),
  );

  static const restoreSubtitlesAccent = ConfirmAccent(
    banner: [Color(0xFF065F46), Color(0xFF059669), Color(0xFF22D3EE)],
    gradient: LinearGradient(colors: [Color(0xFF34D399), Color(0xFF22D3EE)]),
    c1: Color(0xFF34D399),
    c2: Color(0xFF22D3EE),
  );
}

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
