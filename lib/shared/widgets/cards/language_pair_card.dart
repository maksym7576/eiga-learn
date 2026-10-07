import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../database/seeds/language_seed.dart';
import '../../../database/dtos/language_dto.dart';
import '../../../database/models/language_profile.dart';

/// Віджет для відображення пари мов (оригінал → переклад) без стрілочки випадаючого списку.
class LanguagePairCard extends StatelessWidget {
  const LanguagePairCard({
    super.key,
    required this.sourceLang,
    required this.targetLang,
    this.useFullNames = true,
  });

  final String sourceLang;
  final String targetLang;
  final bool useFullNames;

  factory LanguagePairCard.fromProfile(
    LanguageProfile profile, {
    Key? key,
    bool useFullNames = true,
  }) {
    return LanguagePairCard(
      key: key,
      sourceLang: profile.sourceLang,
      targetLang: profile.targetLang,
      useFullNames: useFullNames,
    );
  }

  static List<LanguageDto> get _langs => LanguageSeed.languages;

  static LanguageDto? _find(String code) {
    for (final l in _langs) {
      if (l.code.toLowerCase() == code.toLowerCase()) return l;
    }
    return null;
  }

  static String _name(String code) => _find(code)?.name ?? code.toUpperCase();

  @override
  Widget build(BuildContext context) {
    final sText = useFullNames ? _name(sourceLang) : sourceLang.toUpperCase();
    final tText = useFullNames ? _name(targetLang) : targetLang.toUpperCase();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderDefault, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            sText,
            style: AppTypography.title.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.textSecondary),
          ),
          Text(
            tText,
            style: AppTypography.title.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
