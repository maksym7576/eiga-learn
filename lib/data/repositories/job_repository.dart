import 'package:isar_community/isar.dart';
import '../../database/models/job.dart';

class JobRepository {
  JobRepository(this.isar);
  final Isar isar;

  Future<void> save(Job job) async {
    await isar.writeTxn(() async {
      await isar.jobs.put(job);
    });
  }

  Future<void> saveAll(List<Job> jobs) async {
    await isar.writeTxn(() async {
      await isar.jobs.putAll(jobs);
    });
  }

  Future<Job?> getById(Id id) async {
    return await isar.jobs.get(id);
  }

  Future<List<Job>> getAll() async {
    return await isar.jobs.where().findAll();
  }

  Stream<List<Job>> watchAll() {
    return isar.jobs.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.jobs.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.jobs.clear();
    });
  }
}
