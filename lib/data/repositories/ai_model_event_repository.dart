import 'package:isar_community/isar.dart';
import '../../database/models/ai_model_event.dart';

class AiModelEventRepository {
  AiModelEventRepository(this.isar);
  final Isar isar;

  Future<void> save(AiModelEvent event) async {
    await isar.writeTxn(() async {
      await isar.aiModelEvents.put(event);
    });
  }

  Future<void> saveAll(List<AiModelEvent> events) async {
    await isar.writeTxn(() async {
      await isar.aiModelEvents.putAll(events);
    });
  }

  Future<AiModelEvent?> getById(Id id) async {
    return await isar.aiModelEvents.get(id);
  }

  Future<List<AiModelEvent>> getAll() async {
    return await isar.aiModelEvents.where().findAll();
  }

  Stream<List<AiModelEvent>> watchAll() {
    return isar.aiModelEvents.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.aiModelEvents.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.aiModelEvents.clear();
    });
  }
}
