import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../database/models/video.dart';
import '../../../../database/models/phrase.dart';
import '../../../../shared/providers/video_providers.dart';
import '../../../../services/pipeline/providers.dart';
import '../../../../shared/player/active_player_provider.dart';

/// Notifier для вибраного ID відео
class SelectedVideoIdNotifier extends Notifier<int?> {
  @override
  int? build() => null;

  void setVideoId(int? id) => state = id;
}

final selectedVideoIdProvider =
    NotifierProvider<SelectedVideoIdNotifier, int?>(SelectedVideoIdNotifier.new);

/// Notifier для стану автоскролу
class IsAutoScrollEnabledNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void setEnabled(bool enabled) => state = enabled;
  void toggle() => state = !state;
}

final isAutoScrollEnabledProvider =
    NotifierProvider<IsAutoScrollEnabledNotifier, bool>(IsAutoScrollEnabledNotifier.new);

/// Стрім-провайдер поточного відео
final currentVideoProvider = StreamProvider<Video?>((ref) {
  final videoId = ref.watch(selectedVideoIdProvider);
  if (videoId == null) return Stream.value(null);
  final repo = ref.watch(videoRepositoryProvider);
  return repo.watchById(videoId);
});

/// Стрім-провайдер списку фраз для поточного відео
final phrasesStreamProvider = StreamProvider<List<Phrase>>((ref) {
  final videoId = ref.watch(selectedVideoIdProvider);
  if (videoId == null) return Stream.value([]);
  final repo = ref.watch(phraseRepoProvider);
  return repo.watchByVideo(videoId);
});

/// Провайдер ID активної фрази (на основі поточного часу відтворення)
final stickyActivePhraseIdProvider = Provider<int?>((ref) {
  final pos = ref.watch(activePlayerProvider.select((s) => s.position));
  final phrasesAsync = ref.watch(phrasesStreamProvider);
  final phrases = phrasesAsync.value ?? [];
  if (phrases.isEmpty) return null;

  final posMs = pos.inMilliseconds;
  int? activeId;

  for (final phrase in phrases) {
    if (phrase.startTime <= posMs) {
      activeId = phrase.id;
    } else {
      break;
    }
  }

  return activeId;
});
