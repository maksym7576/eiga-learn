import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/shared/player/active_player_provider.dart';
import 'package:eiga/features/player/presentation/providers/player_video_providers.dart';

final activePhrasesProvider = Provider<List<Phrase>>((ref) {
  final position = ref.watch(activePlayerProvider.select((s) => s.position));
  final posMs = position.inMilliseconds;
  final phrasesAsync = ref.watch(phrasesStreamProvider);

  final phrases = phrasesAsync.value ?? [];
  if (phrases.isEmpty) return [];

  return phrases.where((p) {
    return posMs >= p.startTime && posMs <= p.endTime;
  }).toList();
});
