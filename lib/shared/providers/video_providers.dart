import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repositories/video_repository.dart';
import '../../services/database/video_service.dart';
import '../../database/models/video.dart';
import 'language_profile_providers.dart';

final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return VideoRepository(isar);
});

final videoServiceProvider = Provider<VideoService>((ref) {
  final repo = ref.watch(videoRepositoryProvider);
  return VideoService(repo);
});

/// Стрім-провайдер, який спостерігає за всіма відео в Isar в реальному часі (з fireImmediately: true)
final videosStreamProvider = StreamProvider<List<Video>>((ref) {
  final service = ref.watch(videoServiceProvider);
  return service.watchAll();
});
