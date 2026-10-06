import 'package:isar_community/isar.dart';
import '../../data/repositories/language_profile_repository.dart';
import '../../database/models/language_profile.dart';

class LanguageProfileService {
  LanguageProfileService(this.repository);

  final LanguageProfileRepository repository;

  /// Створити новий профіль мови
  Future<void> createProfile({
    required String sourceLang,
    required String targetLang,
  }) async {
    final profile = LanguageProfile()
      ..sourceLang = sourceLang
      ..targetLang = targetLang
      ..isActive = true
      ..createdAt = DateTime.now()
      ..lastOpenedAt = DateTime.now();

    await repository.save(profile);
  }

  /// Отримати всі профілі
  Future<List<LanguageProfile>> getAll() => repository.getAll();

  /// Стрім усіх профілів у реальному часі (watchAll з fireImmediately: true)
  Stream<List<LanguageProfile>> watchAll() => repository.watchAll();

  /// Оновити існуючий профіль
  Future<void> update(LanguageProfile profile) => repository.save(profile);

  /// Видалити профіль
  Future<bool> delete(Id id) => repository.delete(id);
}
