import 'package:flutter/material.dart';
import 'package:eiga/database/models/language_profile.dart';
import 'package:eiga/database/seeds/language_seed.dart';
import 'package:eiga/database/dtos/language_dto.dart';

/// Підписи мов/профілів.
abstract final class ProfileLabels {
  static LanguageDto? _find(String code) {
    for (final l in LanguageSeed.languages) {
      if (l.code.toLowerCase() == code.toLowerCase()) return l;
    }
    return null;
  }

  static String name(String code) => _find(code)?.name ?? code.toUpperCase();

  static String pair(LanguageProfile p) =>
      '${name(p.sourceLang)}  →  ${name(p.targetLang)}';

  static String codes(LanguageProfile p) =>
      '${p.sourceLang.toUpperCase()}  →  ${p.targetLang.toUpperCase()}';
}
