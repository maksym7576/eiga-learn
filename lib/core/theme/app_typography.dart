import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  static const String fontSans = 'Plus Jakarta Sans';
  static const String fontJp = 'M PLUS Rounded 1c';

  static final TextStyle display = TextStyle(
    fontFamily: fontSans,
    fontSize: 72,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -1.5,
  );

  static final TextStyle logo = TextStyle(
    fontFamily: fontSans,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -1.0,
  );

  static final TextStyle h1 = TextStyle(
    fontFamily: fontSans,
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.8,
  );

  static final TextStyle h2 = TextStyle(
    fontFamily: fontSans,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static final TextStyle h3Cta = TextStyle(
    fontFamily: fontSans,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static final TextStyle title = TextStyle(
    fontFamily: fontSans,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final TextStyle subtitle = TextStyle(
    fontFamily: fontSans,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static final TextStyle bodyLg = TextStyle(
    fontFamily: fontSans,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static final TextStyle body = TextStyle(
    fontFamily: fontSans,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final TextStyle bodySm = TextStyle(
    fontFamily: fontSans,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static final TextStyle caption = TextStyle(
    fontFamily: fontSans,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSubtle,
  );

  static final TextStyle micro = TextStyle(
    fontFamily: fontSans,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textFaint,
  );

  static final TextStyle nano = TextStyle(
    fontFamily: fontSans,
    fontSize: 10,
    fontWeight: FontWeight.w800,
    color: AppColors.textAccent,
  );

  static final TextStyle bigNumber = TextStyle(
    fontFamily: fontSans,
    fontSize: 46,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}
