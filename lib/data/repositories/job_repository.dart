import 'package:isar_community/isar.dart';
import '../../database/models/job.dart';
import 'base_repository.dart';

class JobRepository extends BaseRepository<Job> {
  JobRepository(super.isar);

  @override
  IsarCollection<Job> get collection => isar.jobs;

  Future<List<Job>> getByStatus(List<String> statuses) async {
    return await isar.jobs
        .filter()
        .anyOf(statuses, (q, status) => q.statusEqualTo(status))
        .findAll();
  }

  Stream<List<Job>> watchActive() {
    return isar.jobs
        .filter()
        .statusEqualTo('processing')
        .or()
        .statusEqualTo('queued')
        .watch(fireImmediately: true);
  }

  Future<Job?> getNextQueued() async {
    return await isar.jobs
        .filter()
        .statusEqualTo('queued')
        .sortByPriorityDesc()
        .thenByCreatedAt()
        .findFirst();
  }

  Future<List<Job>> getActiveForVideo(int videoId) async {
    return await isar.jobs
        .filter()
        .videoIdEqualTo(videoId)
        .and()
        .group((q) => q.statusEqualTo('processing').or().statusEqualTo('queued'))
        .findAll();
  }

  Future<List<Job>> findStale(DateTime olderThan) async {
    return await isar.jobs
        .filter()
        .statusEqualTo('processing')
        .and()
        .lastActivityAtLessThan(olderThan)
        .findAll();
  }

  Future<void> touch(Id id) async {
    await isar.writeTxn(() async {
      final job = await isar.jobs.get(id);
      if (job != null) {
        job.lastActivityAt = DateTime.now();
        await isar.jobs.put(job);
      }
    });
  }

  Future<void> updateProgress(
    Id id, {
    int? processedPhrases,
    int? totalPhrases,
    String? currentStep,
    String? status,
  }) async {
    await isar.writeTxn(() async {
      final job = await isar.jobs.get(id);
      if (job != null) {
        if (processedPhrases != null) job.processedPhrases = processedPhrases;
        if (totalPhrases != null) job.totalPhrases = totalPhrases;
        if (currentStep != null) job.currentStep = currentStep;
        if (status != null) job.status = status;
        job.lastActivityAt = DateTime.now();
        await isar.jobs.put(job);
      }
    });
  }
}
