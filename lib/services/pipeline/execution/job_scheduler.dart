import 'dart:async';
import 'package:eiga/data/repositories/job_repository.dart';
import 'package:eiga/data/repositories/phrase_repository.dart';
import 'package:eiga/database/models/job.dart';
import 'runner.dart';

class JobScheduler {
  JobScheduler({
    required this.jobRepo,
    required this.phraseRepo,
    required this.runner,
  });

  final JobRepository jobRepo;
  final PhraseRepository phraseRepo;
  final Runner runner;

  StreamSubscription? _subscription;
  bool _isRunning = false;

  void start() {
    if (_isRunning) return;
    _isRunning = true;

    _subscription = jobRepo.watchActive().listen((jobs) async {
      final queued = jobs.where((j) => j.status == 'queued').toList();
      if (queued.isNotEmpty) {
        final job = queued.first;
        await _processJob(job);
      }
    });
  }

  Future<void> _processJob(Job job) async {
    job.status = 'processing';
    job.startedAt = DateTime.now();
    job.lastActivityAt = DateTime.now();
    await jobRepo.save(job);

    try {
      final phrases = await phraseRepo.getByOrders(job.videoId, job.phraseOrders);
      await runner.runJob(job, phrases);

      job.status = 'completed';
      job.finishedAt = DateTime.now();
      await jobRepo.save(job);
    } catch (e) {
      job.status = 'failed';
      job.errorMessage = e.toString();
      job.finishedAt = DateTime.now();
      await jobRepo.save(job);
    }
  }

  void stop() {
    _subscription?.cancel();
    _isRunning = false;
  }
}
