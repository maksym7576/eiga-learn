import 'package:flutter/material.dart';
import 'package:eiga/core/theme/dark_theme.dart';
import 'package:eiga/core/theme/phrase_theme_data.dart';

enum WordStatus {
  normal,
  newWord, // s-u (#cu)
  learning, // s-l (#cl)
  known, // s-k (#ck)
}

class WordColors {
  final PhraseThemeData theme;

  const WordColors([this.theme = darkPhraseThemeData]);

  Color get newWordColor => theme.cuNewColor;
  Color get learningColor => theme.clLearnColor;
  Color get knownColor => theme.ckKnownColor;
  Color get highlightBg => theme.highlightBg;
  Color get defaultTextColor => theme.foregroundColor;
  Color get dimTextColor => theme.dimTextColor;
  Color get translationColor => theme.translationColor;
  Color get activeAccentColor => theme.activeAccentColor;
  Color get activeFillColor => theme.activeFillColor;
  Color get backgroundColor => theme.backgroundColor;

  Color getColorForStatus(WordStatus status) {
    return switch (status) {
      WordStatus.newWord => newWordColor,
      WordStatus.learning => learningColor,
      WordStatus.known => knownColor,
      WordStatus.normal => defaultTextColor,
    };
  }

  FontWeight getWeightForStatus(WordStatus status, FontWeight defaultWeight) {
    return switch (status) {
      WordStatus.newWord => FontWeight.w700,
      WordStatus.learning => FontWeight.w700,
      WordStatus.known => FontWeight.w500,
      WordStatus.normal => defaultWeight,
    };
  }
}
