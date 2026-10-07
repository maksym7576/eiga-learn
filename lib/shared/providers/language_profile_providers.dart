import 'package:isar_community/isar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repositories/language_profile_repository.dart';
import '../../services/database/language_profile_service.dart';
import '../../services/database/isar_service.dart';
import '../../database/models/language_profile.dart';

final languageProfileRepositoryProvider = Provider<LanguageProfileRepository>((ref) {
  final isar = ref.watch(metaIsarProvider);
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

/// Поточний активний профіль мови в реальному часі
final activeProfileProvider = Provider<LanguageProfile?>((ref) {
  final profiles = ref.watch(languageProfilesStreamProvider).asData?.value ?? [];
  return profiles.where((p) => p.isActive).firstOrNull;
});

/// Реактивний `isarProvider`, який автоматично переключається на базу даних активного профілю
final isarProvider = Provider<Isar>((ref) {
  final activeProfile = ref.watch(activeProfileProvider);
  final dbName = activeProfile?.dbName ?? 'default';

  final instance = Isar.getInstance(dbName);
  if (instance != null) {
    return instance;
  }

  return Isar.getInstance('default') ?? Isar.getInstance('meta')!;
});
