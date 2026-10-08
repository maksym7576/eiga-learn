import 'package:isar_community/isar.dart';
import 'package:eiga/data/repositories/job_repository.dart';
import 'package:eiga/database/models/job.dart';

class JobService {
  JobService(this.jobRepo);
  final JobRepository jobRepo;

  Future<Job> createJob({
    required int videoId,
    required String modelName,
    required String kind,
    required String mode,
    required List<String> executionPlan,
    int priority = 0,
    String? pipelineId,
    String? pipelineVersion,
    int? parentJobId,
    String? transcriptionLanguage,
  }) async {
    final job = Job()
      ..videoId = videoId
      ..modelName = modelName
      ..kind = kind
      ..mode = mode
      ..executionPlan = executionPlan
      ..priority = priority
      ..pipelineId = pipelineId
      ..pipelineVersion = pipelineVersion
      ..parentJobId = parentJobId
      ..transcriptionLanguage = transcriptionLanguage
      ..status = 'queued'
      ..phase = 'init'
      ..createdAt = DateTime.now()
      ..lastActivityAt = DateTime.now()
      ..attempt = 1;

    await jobRepo.save(job);
    return job;
  }

  Future<Job?> getNextQueued() async {
    return await jobRepo.getNextQueued();
  }

  Future<void> updateProgress(Id id, {int? processed, int? total, String? step, String? status}) async {
    await jobRepo.updateProgress(id, processedPhrases: processed, totalPhrases: total, currentStep: step, status: status);
  }

  Future<void> touch(Id id) async {
    await jobRepo.touch(id);
  }

  Future<void> cancel(Id id) async {
    await jobRepo.updateProgress(id, status: 'cancelled');
  }
}
