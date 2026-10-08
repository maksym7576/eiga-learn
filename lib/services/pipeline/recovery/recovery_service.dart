import 'package:eiga/data/repositories/job_repository.dart';
import 'package:eiga/services/pipeline/execution/phrase_progress_service.dart';

class RecoveryService {
  RecoveryService({
    required this.jobRepo,
    required this.phraseProgressService,
  });

  final JobRepository jobRepo;
  final PhraseProgressService phraseProgressService;

  Future<void> recoverOnStartup() async {
    final staleJobs = await jobRepo.findStale(DateTime.now().subtract(const Duration(minutes: 5)));
    for (final job in staleJobs) {
      job.status = 'interrupted';
      job.errorMessage = 'Stale job recovered on startup';
      await jobRepo.save(job);
    }
  }
}
