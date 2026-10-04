import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgApp,
      colorScheme: ColorScheme.dark(
        primary: AppColors.violet700,
        secondary: AppColors.sky500,
        surface: AppColors.surfaceGlass,
        background: AppColors.bgApp,
        error: AppColors.danger,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.textPrimary,
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
}
