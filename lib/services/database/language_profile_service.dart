import 'package:isar_community/isar.dart';
import '../../data/repositories/language_profile_repository.dart';
import '../../database/models/language_profile.dart';
import 'isar_service.dart';

class LanguageProfileService {
  LanguageProfileService(this.repository);

  final LanguageProfileRepository repository;

  /// Створити новий профіль мови та його файл бази даних
  Future<LanguageProfile> createProfile({
    required String sourceLang,
    required String targetLang,
  }) async {
    // 1. Деактивувати всі попередні профілі
    final allProfiles = await repository.getAll();
    for (final p in allProfiles) {
      p.isActive = false;
      await repository.save(p);
    }

    final dbName = 'profile_${sourceLang.toLowerCase()}_${targetLang.toLowerCase()}';

    // 2. Відкрити/ініціалізувати файл бази даних (Isar) для цього профілю
    await DatabaseService.openIsar(name: dbName);

    final profile = LanguageProfile()
      ..sourceLang = sourceLang
      ..targetLang = targetLang
      ..dbName = dbName
      ..isActive = true
      ..createdAt = DateTime.now()
      ..lastOpenedAt = DateTime.now();

    await repository.save(profile);
    return profile;
  }

  /// Отримати всі профілі
  Future<List<LanguageProfile>> getAll() => repository.getAll();

  /// Стрім усіх профілів у реальному часі
  Stream<List<LanguageProfile>> watchAll() => repository.watchAll();

  /// Оновити існуючий профіль
  Future<void> update(LanguageProfile profile) => repository.save(profile);

  /// Видалити профіль
  Future<bool> delete(Id id) => repository.delete(id);
}
