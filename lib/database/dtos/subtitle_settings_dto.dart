import 'package:isar_community/isar.dart';

part 'subtitle_settings_dto.g.dart';

@embedded
class SubtitleSettingsDto {
  double fontSize = 12.0;
  double windowedFontSize = 16.0;
  double outlineWidth = 1.0;
  double backdropOpacity = 0.6;
  double backdropPadding = 8.0;
  bool showBackdrop = true;
  double verticalOffset = 0.03;
  double fontWeightFs = 0.7;
  double fontWeightWin = 0.0;
  double globalOutlineWidthFs = 1.5;

  // Advanced Typography - Fullscreen
  double letterSpacingFs = 2.0;
  double translationLetterSpacingFs = 0.0;
  double originalScaleFs = 1.0;
  double translationScaleFs = 1.0;
  double additionalScaleFs = 1.0;
  double originalOutlineWidthFs = 1.0;
  double translationOutlineWidthFs = 1.0;
  double originalToTranslationSpacingFs = 0.0;
  double originalToAdditionalSpacingFs = 1.0;

  // Advanced Typography - Windowed
  double letterSpacingWin = 0.0;
  double translationLetterSpacingWin = 0.0;
  double originalScaleWin = 1.0;
  double translationScaleWin = 1.0;
  double additionalScaleWin = 1.0;
}
