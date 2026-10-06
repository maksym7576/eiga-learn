import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repositories/language_profile_repository.dart';
import '../../services/database/language_profile_service.dart';
import '../../services/database/isar_service.dart';
import '../../database/models/language_profile.dart';

final languageProfileRepositoryProvider = Provider<LanguageProfileRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return LanguageProfileRepository(isar);
});

final languageProfileServiceProvider = Provider<LanguageProfileService>((ref) {
  final repo = ref.watch(languageProfileRepositoryProvider);
  return LanguageProfileService(repo);
});

/// Стрім-провайдер, який спостерігає за всіма профілями в Isar в реальному часі (з fireImmediately: true)
final languageProfilesStreamProvider = StreamProvider<List<LanguageProfile>>((ref) {
  final service = ref.watch(languageProfileServiceProvider);
  return service.watchAll();
});
