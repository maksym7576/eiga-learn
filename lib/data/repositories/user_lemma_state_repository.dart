import 'package:isar_community/isar.dart';
import '../../database/models/user_lemma_state.dart';

class UserLemmaStateRepository {
  UserLemmaStateRepository(this.isar);
  final Isar isar;

  Future<void> save(UserLemmaState state) async {
    await isar.writeTxn(() async {
      await isar.userLemmaStates.put(state);
    });
  }

  Future<void> saveAll(List<UserLemmaState> states) async {
    await isar.writeTxn(() async {
      await isar.userLemmaStates.putAll(states);
    });
  }

  Future<UserLemmaState?> getById(Id id) async {
    return await isar.userLemmaStates.get(id);
  }

  Future<List<UserLemmaState>> getAll() async {
    return await isar.userLemmaStates.where().findAll();
  }

  Stream<List<UserLemmaState>> watchAll() {
    return isar.userLemmaStates.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.userLemmaStates.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.userLemmaStates.clear();
    });
  }
}
