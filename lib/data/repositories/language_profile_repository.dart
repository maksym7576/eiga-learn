import 'package:isar_community/isar.dart';
import '../../database/models/language_profile.dart';
import 'base_repository.dart';

class LanguageProfileRepository extends BaseRepository<LanguageProfile> {
  LanguageProfileRepository(super.isar);

  @override
  IsarCollection<LanguageProfile> get collection => isar.languageProfiles;

  @override
  Future<void> save(LanguageProfile profile) async {
    await isar.writeTxn(() async {
      profile.createdAt ??= DateTime.now();
      profile.lastOpenedAt = DateTime.now();
      await isar.languageProfiles.put(profile);
    });
  }

  Future<LanguageProfile?> getActive() async {
    return await isar.languageProfiles.filter().isActiveEqualTo(true).findFirst();
  }
}
