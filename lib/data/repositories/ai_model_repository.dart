import 'package:isar_community/isar.dart';
import '../../database/models/ai_model.dart';

class AiModelRepository {
  AiModelRepository(this.isar);
  final Isar isar;

  Future<void> save(AiModel model) async {
    await isar.writeTxn(() async {
      await isar.aiModels.put(model);
    });
  }

  Future<void> saveAll(List<AiModel> models) async {
    await isar.writeTxn(() async {
      await isar.aiModels.putAll(models);
    });
  }

  Future<AiModel?> getById(Id id) async {
    return await isar.aiModels.get(id);
  }

  Future<List<AiModel>> getAll() async {
    return await isar.aiModels.where().findAll();
  }

  Stream<List<AiModel>> watchAll() {
    return isar.aiModels.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.aiModels.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.aiModels.clear();
    });
  }
}
