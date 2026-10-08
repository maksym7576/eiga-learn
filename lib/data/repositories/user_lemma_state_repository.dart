import 'package:isar_community/isar.dart';
import '../../database/models/user_lemma_state.dart';
import 'base_repository.dart';

class UserLemmaStateRepository extends BaseRepository<UserLemmaState> {
  UserLemmaStateRepository(super.isar);

  @override
  IsarCollection<UserLemmaState> get collection => isar.userLemmaStates;

  Future<UserLemmaState?> getByLemmaKey(String lemmaKey) async {
    return await isar.userLemmaStates.filter().lemmaKeyEqualTo(lemmaKey).findFirst();
  }

  Future<List<UserLemmaState>> getByStatus(String status) async {
    return await isar.userLemmaStates.filter().statusEqualTo(status).findAll();
  }
}
