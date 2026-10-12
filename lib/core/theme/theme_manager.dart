import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/player/subtitle_settings_provider.dart';
import 'dark_theme.dart';
import 'light_theme.dart';
import 'phrase_theme_data.dart';

class ThemeManager {
  static PhraseThemeData getPhraseTheme({required bool isDarkTheme}) {
    return isDarkTheme ? darkPhraseThemeData : lightPhraseThemeData;
  }
}

final phraseThemeManagerProvider = Provider<PhraseThemeData>((ref) {
  final isDark = ref.watch(subtitleSettingsProvider.select((s) => s.isDarkTheme));
  return ThemeManager.getPhraseTheme(isDarkTheme: isDark);
});
