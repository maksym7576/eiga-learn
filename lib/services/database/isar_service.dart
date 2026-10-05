import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/models/video.dart';
import '../../database/models/phrase.dart';
import '../../database/models/lemma.dart';
import '../../database/models/lemma_gloss.dart';
import '../../database/models/lemma_usage.dart';
import '../../database/models/job.dart';
import '../../database/models/ai_model.dart';
import '../../database/models/ai_model_score.dart';
import '../../database/models/ai_model_daily_stat.dart';
import '../../database/models/ai_model_event.dart';
import '../../database/models/user_lemma_state.dart';
import '../../database/models/language_profile.dart';
import '../../core/config/app_config.dart';
import '../../data/repositories/language_repository.dart';

class DatabaseService {
  static Future<Isar> openIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        VideoSchema,
        PhraseSchema,
        LemmaSchema,
        LemmaGlossSchema,
        LemmaUsageSchema,
        JobSchema,
        AiModelSchema,
        AiModelScoreSchema,
        AiModelDailyStatSchema,
        AiModelEventSchema,
        UserLemmaStateSchema,
        LanguageProfileSchema,
      ],
      directory: dir.path,
    );
  }
}

final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be overridden');
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden');
});

final appConfigProvider = Provider<AppConfig>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppConfig(prefs);
});

final localeProvider = Provider<String>((ref) {
  final appConfig = ref.watch(appConfigProvider);
  return appConfig.getAppLanguage;
});

final languageRepositoryProvider = Provider<LanguageRepository>((ref) {
  return LanguageRepository();
});

final videoApiServerProvider = Provider<void>((ref) {});
final syncDevicesProvider = Provider<void>((ref) {});
