import 'package:isar_community/isar.dart';

abstract class BaseRepository<T> {
  BaseRepository(this.isar);
  final Isar isar;

  IsarCollection<T> get collection;

  Future<void> save(T entity) async {
    await isar.writeTxn(() async {
      await collection.put(entity);
    });
  }

  Future<void> saveAll(List<T> entities) async {
    await isar.writeTxn(() async {
      await collection.putAll(entities);
    });
  }

  Future<T?> getById(Id id) async {
    return await collection.get(id);
  }

  Future<List<T>> getAll() async {
    return await collection.where().findAll();
  }

  Stream<List<T>> watchAll() {
    return collection.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await collection.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await collection.clear();
    });
  }
}
