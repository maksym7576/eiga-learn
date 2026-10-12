import 'package:flutter/material.dart';
import 'app_typography.dart';
import 'phrase_theme_data.dart';

/// Всі семантичні кольори та поверхні темної теми (Ніч)
class DarkThemeColors {
  // Фрази та словоформи (Ніч з HTML)
  static const Color backgroundColor = Color(0xFF13151B);
  static const Color foregroundColor = Color(0xFFE8EBF2);
  static const Color dimTextColor = Color(0xFF9AA3B6);
  static const Color translationColor = Color(0xFFAAB1C2);
  static const Color activeAccentColor = Color(0xFF8FA8FF);
  static const Color activeFillColor = Color(0x0DFFFFFF);
  static const Color highlightBg = Color(0x3D8FA8FF);
  static const Color cuNewColor = Color(0xFFFF8DA0);
  static const Color clLearnColor = Color(0xFFBCAAFF);
  static const Color ckKnownColor = Color(0xFF6FD3B0);

  // Семантичні поверхні
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

  // Текст
  static const Color textPrimary = Colors.white;
  static final Color textStrong = Colors.white.withOpacity(0.95);
  static final Color textSecondary = Colors.white.withOpacity(0.80);
  static final Color textMuted = Colors.white.withOpacity(0.65);
  static final Color textSubtle = Colors.white.withOpacity(0.60);
  static final Color textFaint = Colors.white.withOpacity(0.45);
  static const Color textAccent = Color(0xFFa5f3fc);

  // Бордери
  static final Color borderDefault = Colors.white.withOpacity(0.22);
  static final Color borderStrong = Colors.white.withOpacity(0.28);
  static final Color borderHover = const Color(0xFF67e8f9).withOpacity(0.75);
  static final Color borderSelected = const Color(0xFFc4b5fd).withOpacity(0.70);
  static final Color borderAccentSoft = const Color(0xFF67e8f9).withOpacity(0.40);

  // Статуси
  static const Color danger = Color(0xFFef4444);
}

/// Базова темна палітра фраз (Ніч з HTML макета)
const darkPhraseThemeData = PhraseThemeData(
  backgroundColor: DarkThemeColors.backgroundColor,
  foregroundColor: DarkThemeColors.foregroundColor,
  dimTextColor: DarkThemeColors.dimTextColor,
  translationColor: DarkThemeColors.translationColor,
  activeAccentColor: DarkThemeColors.activeAccentColor,
  activeFillColor: DarkThemeColors.activeFillColor,
  highlightBg: DarkThemeColors.highlightBg,
  cuNewColor: DarkThemeColors.cuNewColor,
  clLearnColor: DarkThemeColors.clLearnColor,
  ckKnownColor: DarkThemeColors.ckKnownColor,
);

/// Базова темна тема Flutter (ThemeData)
ThemeData get darkAppTheme {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkThemeColors.bgApp,
    canvasColor: DarkThemeColors.bgApp,
    colorScheme: ColorScheme.dark(
      primary: DarkThemeColors.activeAccentColor,
      secondary: const Color(0xFF0ea5e9),
      surface: DarkThemeColors.surfaceGlass,
      error: DarkThemeColors.danger,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: DarkThemeColors.textPrimary,
    ),
    fontFamily: AppTypography.fontSans,
    textTheme: TextTheme(
      displayLarge: AppTypography.display,
      headlineLarge: AppTypography.h1,
      headlineMedium: AppTypography.h2,
      titleLarge: AppTypography.title,
      bodyLarge: AppTypography.bodyLg,
      bodyMedium: AppTypography.body,
      bodySmall: AppTypography.bodySm,
      labelLarge: AppTypography.caption,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
    ),
  );
}
