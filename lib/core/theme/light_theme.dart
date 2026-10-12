import 'package:flutter/material.dart';
import 'dark_theme.dart';
import 'phrase_theme_data.dart';

/// Світла тема (Бірюза з HTML макета): перевизначаємо лише потрібні поля.
/// Будь-які невказані значення автоматично беремо з [darkPhraseThemeData].
PhraseThemeData createLightThemeData({
  Color? backgroundColor,
  Color? foregroundColor,
  Color? dimTextColor,
  Color? translationColor,
  Color? activeAccentColor,
  Color? activeFillColor,
  Color? highlightBg,
  Color? cuNewColor,
  Color? clLearnColor,
  Color? ckKnownColor,
}) {
  return PhraseThemeData(
    backgroundColor: backgroundColor ?? darkPhraseThemeData.backgroundColor,
    foregroundColor: foregroundColor ?? darkPhraseThemeData.foregroundColor,
    dimTextColor: dimTextColor ?? darkPhraseThemeData.dimTextColor,
    translationColor: translationColor ?? darkPhraseThemeData.translationColor,
    activeAccentColor: activeAccentColor ?? darkPhraseThemeData.activeAccentColor,
    activeFillColor: activeFillColor ?? darkPhraseThemeData.activeFillColor,
    highlightBg: highlightBg ?? darkPhraseThemeData.highlightBg,
    cuNewColor: cuNewColor ?? darkPhraseThemeData.cuNewColor,
    clLearnColor: clLearnColor ?? darkPhraseThemeData.clLearnColor,
    ckKnownColor: ckKnownColor ?? darkPhraseThemeData.ckKnownColor,
  );
}

final lightPhraseThemeData = createLightThemeData(
  backgroundColor: const Color(0xFFF4F5F7),
  foregroundColor: const Color(0xFF181C24),
  dimTextColor: const Color(0xFF5A6376),
  translationColor: const Color(0xFF4B5362),
  activeAccentColor: const Color(0xFF3F5FB5),
  activeFillColor: const Color(0x0D181C24),
  highlightBg: const Color(0x2B3F5FB5),
  cuNewColor: const Color(0xFFBE1E4A),
  clLearnColor: const Color(0xFF5B3FD0),
  ckKnownColor: const Color(0xFF0B7D6E),
);

/// Світла тема Flutter (ThemeData): успадковує [darkAppTheme] та змінює лише відмінності.
ThemeData get lightAppTheme {
  final dark = darkAppTheme;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightPhraseThemeData.backgroundColor,
    canvasColor: lightPhraseThemeData.backgroundColor,
    colorScheme: ColorScheme.light(
      primary: lightPhraseThemeData.activeAccentColor,
      secondary: dark.colorScheme.secondary,
      surface: lightPhraseThemeData.backgroundColor,
      error: dark.colorScheme.error,
      onPrimary: dark.colorScheme.onPrimary,
      onSecondary: dark.colorScheme.onSecondary,
      onSurface: lightPhraseThemeData.foregroundColor,
    ),
    fontFamily: dark.textTheme.bodyMedium?.fontFamily,
    textTheme: dark.textTheme.apply(
      bodyColor: lightPhraseThemeData.foregroundColor,
      displayColor: lightPhraseThemeData.foregroundColor,
    ),
    appBarTheme: dark.appBarTheme,
  );
}
