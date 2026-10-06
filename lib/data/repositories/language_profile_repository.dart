import 'package:isar_community/isar.dart';
import '../../database/models/language_profile.dart';

class LanguageProfileRepository {
  LanguageProfileRepository(this.isar);

  final Isar isar;

  /// CRUD: Create / Update
  Future<void> save(LanguageProfile profile) async {
    await isar.writeTxn(() async {
      profile.createdAt ??= DateTime.now();
      profile.lastOpenedAt = DateTime.now();
      await isar.languageProfiles.put(profile);
    });
  }

  /// CRUD: Read by ID
  Future<LanguageProfile?> getById(Id id) async {
    return await isar.languageProfiles.get(id);
  }

  /// Get All
  Future<List<LanguageProfile>> getAll() async {
    return await isar.languageProfiles.where().findAll();
  }

  /// Watch All (Stream з fireImmediately: true, аналог watchVideoById)
  Stream<List<LanguageProfile>> watchAll() {
    return isar.languageProfiles.where().watch(fireImmediately: true);
  }

  /// CRUD: Delete
  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.languageProfiles.delete(id);
    });
  }
}
