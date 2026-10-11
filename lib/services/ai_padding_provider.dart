import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/database/dtos/basic_phrase_dto.dart';
import 'package:eiga/services/subtitle_aligner.dart';
import 'package:eiga/services/subtitle_padding_analyzer.dart';

export 'package:eiga/services/subtitle_padding_analyzer.dart' show PaddingRecommendation;

class AiPaddingState {
  final bool isAnalyzing;
  final PaddingRecommendation? recommendation;

  const AiPaddingState({this.isAnalyzing = false, this.recommendation});

  AiPaddingState copyWith({bool? isAnalyzing, PaddingRecommendation? recommendation}) {
    return AiPaddingState(
      isAnalyzing: isAnalyzing ?? this.isAnalyzing,
      recommendation: recommendation ?? this.recommendation,
    );
  }
}

/// Працює незалежно від AI scan зсуву.
///  - без [windows] дає швидку рекомендацію тільки за паузами між фразами;
///  - з [windows] (після AI scan) уточнює її за реальним аудіо.
class AiPaddingNotifier extends Notifier<AiPaddingState> {
  int _runId = 0;

  @override
  AiPaddingState build() => const AiPaddingState();

  Future<PaddingRecommendation?> analyze({
    required List<BasicPhraseDto> phrases,
    int shiftMs = 0,
    List<AudioWindow> windows = const [],
  }) async {
    final id = ++_runId;
    state = state.copyWith(isAnalyzing: true);

    final epoch = DateTime(1970, 1, 1);
    final raw = <SpeechInterval>[];
    for (final p in phrases) {
      final s = p.startTime.difference(epoch).inMilliseconds;
      final e = p.endTime.difference(epoch).inMilliseconds;
      if (e > s) raw.add(SpeechInterval(s, e));
    }

    final rec = recommendPadding(subtitles: raw, shiftMs: shiftMs, windows: windows);

    // Якщо за цей час стартував новіший аналіз — результат застарів.
    if (id != _runId) return null;
    state = AiPaddingState(isAnalyzing: false, recommendation: rec);
    return rec;
  }

  void reset() {
    _runId++;
    state = const AiPaddingState();
  }
}

final aiPaddingProvider =
    NotifierProvider<AiPaddingNotifier, AiPaddingState>(() => AiPaddingNotifier());
