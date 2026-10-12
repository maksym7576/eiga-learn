import 'package:flutter/material.dart';
import 'dark_theme.dart';

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
  static const Color rose500 = Color(0xFFF43F5E);
  static const Color pink300 = Color(0xFFf9a8d4);
  static const Color white = Color(0xFFffffff);
  static const Color white10 = Color(0x19FFFFFF);
  static const Color white15 = Color(0x26FFFFFF);
  static const Color white20 = Color(0x33FFFFFF);
  static const Color white26 = Color(0x42FFFFFF);
  static const Color white60 = Color(0x99FFFFFF);
  static const Color cyanLight = cyan300;
  static final Color menuBg = const Color(0xFF0E0A22).withOpacity(0.96);

  // Перенаправлення темних семантичних кольорів на DarkThemeColors
  static const Color bgApp = DarkThemeColors.bgApp;
  static const Color bgDeep = DarkThemeColors.bgDeep;
  static const Color bgMid = DarkThemeColors.bgMid;
  static const Color bgCore = DarkThemeColors.bgCore;

  static Color get surfaceGlass => DarkThemeColors.surfaceGlass;
  static Color get surfaceGlassHover => DarkThemeColors.surfaceGlassHover;
  static Color get surfaceGlassDashed => DarkThemeColors.surfaceGlassDashed;
  static Color get surfacePopover => DarkThemeColors.surfacePopover;
  static Color get surfaceDialog => DarkThemeColors.surfaceDialog;
  static Color get surfaceSubtle => DarkThemeColors.surfaceSubtle;

  static const Color textPrimary = DarkThemeColors.textPrimary;
  static Color get textStrong => DarkThemeColors.textStrong;
  static Color get textSecondary => DarkThemeColors.textSecondary;
  static Color get textMuted => DarkThemeColors.textMuted;
  static Color get textSubtle => DarkThemeColors.textSubtle;
  static Color get textFaint => DarkThemeColors.textFaint;
  static const Color textAccent = DarkThemeColors.textAccent;
  static const Color textOnBrand = Colors.white;

  static Color get borderDefault => DarkThemeColors.borderDefault;
  static Color get borderStrong => DarkThemeColors.borderStrong;
  static Color get borderHover => DarkThemeColors.borderHover;
  static Color get borderSelected => DarkThemeColors.borderSelected;
  static Color get borderAccentSoft => DarkThemeColors.borderAccentSoft;

  static const Color success = emerald500;
  static const Color successLight = emerald300;
  static const Color warning = amber500;
  static const Color warningLight = amber300;
  static const Color danger = DarkThemeColors.danger;
  static const Color procTranscribe = cyan400;
  static const Color procTranslate = violet400;

  // Logo colors
  static const Color iconPurple = Color(0xFF52239E);
  static const Color iconIndigo = Color(0xFF2B3AA6);
  static const Color iconTeal = Color(0xFF1D6A9C);
  static const Color iconInk = Color(0xFF170A35);
  static const Color iconInkDeep = Color(0xFF120826);

  static const Color textTop = Color(0xFFF4FCFF);
  static const Color textBottom = Color(0xFF8FDCFF);

  static const Color textShadow = Color(0x730F0846);
  static const Color buttonGlow = Color(0x732B3AA6);

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
