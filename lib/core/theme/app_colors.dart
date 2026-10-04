import 'package:flutter/material.dart';

class AppColors {
  // Primitive Palette
  static const Color violet950 = Color(0xFF030108);
  static const Color violet900 = Color(0xFF0a0418);
  static const Color ink = Color(0xFF0a0518);
  static const Color violet850 = Color(0xFF1e0a3d);
  static const Color violet800 = Color(0xFF4c1d95);
  static const Color violet700 = Color(0xFF7c3aed);
  static const Color violet600 = Color(0xFF6d28d9);
  static const Color violet500 = Color(0xFF9333ea);
  static const Color violet400 = Color(0xFFa78bfa);
  static const Color purple500 = Color(0xFFa855f7);
  static const Color purple400 = Color(0xFFc084fc);
  static const Color purple300 = Color(0xFFc4b5fd);
  static const Color indigo500 = Color(0xFF6366f1);
  static const Color indigo400 = Color(0xFF818cf8);
  static const Color indigo100 = Color(0xFFe0e7ff);
  static const Color blue600 = Color(0xFF2563eb);
  static const Color sky600 = Color(0xFF0284c7);
  static const Color sky500 = Color(0xFF0ea5e9);
  static const Color sky400 = Color(0xFF38bdf8);
  static const Color cyan500 = Color(0xFF06b6d4);
  static const Color cyan400 = Color(0xFF22d3ee);
  static const Color cyan300 = Color(0xFF67e8f9);
  static const Color cyan200 = Color(0xFFa5f3fc);
  static const Color teal400 = Color(0xFF2dd4bf);
  static const Color slate300 = Color(0xFFcbd5e1);
  static const Color emerald500 = Color(0xFF10b981);
  static const Color emerald300 = Color(0xFF6ee7b7);
  static const Color amber500 = Color(0xFFf59e0b);
  static const Color amber300 = Color(0xFFfcd34d);
  static const Color red500 = Color(0xFFef4444);
  static const Color pink300 = Color(0xFFf9a8d4);
  static const Color white = Color(0xFFffffff);

  // Semantic Surfaces
  static const Color bgApp = Color(0xFF0a0518);
  static const Color bgDeep = Color(0xFF030108);
  static const Color bgMid = Color(0xFF0a0418);
  static const Color bgCore = Color(0xFF1e0a3d);

  static final Color surfaceGlass = const Color(0xFF0C081E).withOpacity(0.78);
  static final Color surfaceGlassHover = const Color(0xFF1E1440).withOpacity(0.92);
  static final Color surfaceGlassDashed = const Color(0xFF0C081E).withOpacity(0.72);
  static final Color surfacePopover = const Color(0xFF0E0A22).withOpacity(0.96);
  static final Color surfaceDialog = const Color(0xFF0E0A22).withOpacity(0.95);
  static final Color surfaceSubtle = const Color(0xFFFFFFFF).withOpacity(0.09);

  // Text
  static const Color textPrimary = Colors.white;
  static final Color textStrong = Colors.white.withOpacity(0.95);
  static final Color textSecondary = Colors.white.withOpacity(0.80);
  static final Color textMuted = Colors.white.withOpacity(0.65);
  static final Color textSubtle = Colors.white.withOpacity(0.60);
  static final Color textFaint = Colors.white.withOpacity(0.45);
  static const Color textAccent = Color(0xFFa5f3fc);
  static const Color textOnBrand = Colors.white;

  // Borders
  static final Color borderDefault = Colors.white.withOpacity(0.22);
  static final Color borderStrong = Colors.white.withOpacity(0.28);
  static final Color borderHover = const Color(0xFF67e8f9).withOpacity(0.75);
  static final Color borderSelected = const Color(0xFFc4b5fd).withOpacity(0.70);
  static final Color borderAccentSoft = const Color(0xFF67e8f9).withOpacity(0.40);

  // Status
  static const Color success = emerald500;
  static const Color successLight = emerald300;
  static const Color warning = amber500;
  static const Color warningLight = amber300;
  static const Color danger = red500;
  static const Color procTranscribe = cyan400;
  static const Color procTranslate = violet400;

  // Gradients
  static const LinearGradient gradBrand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [violet700, indigo500, sky500],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient gradSelected = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xE65B21B6), Color(0xBF2563EB)],
  );

  static const LinearGradient gradTextCyan = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cyan300, sky400, indigo400],
    stops: [0.0, 0.55, 1.0],
  );

  static const LinearGradient gradWarn = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [amber500, red500],
  );
}
