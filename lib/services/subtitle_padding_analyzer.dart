import 'dart:math' as math;
import 'subtitle_aligner.dart' show SpeechInterval, AudioWindow;

class PaddingRecommendation {
  /// Рекомендоване розширення (мс) в обидва боки: 0, 100 .. maxPaddingMs.
  final int paddingMs;

  /// Чи варто вмикати Fill Gaps.
  final bool fillGaps;

  /// Паузи коротші за це значення (мс) вважаються "склеєними" (Fill Gaps закриває їх).
  final int fillGapsMaxMs;

  /// Скільки треба розширити, щоб повністю покрити мовлення (за аудіо). null — аудіо не було.
  final int? leadNeedMs;
  final int? tailNeedMs;

  /// Для кожного значення розширення (0,100..500): частка справжніх пауз,
  /// у які це розширення влазить з обох боків без накладання.
  final Map<int, double> fitByPaddingMs;

  final int realGaps;
  final int joinedGaps;
  final bool usedAudio;

  const PaddingRecommendation({
    required this.paddingMs,
    required this.fillGaps,
    required this.fillGapsMaxMs,
    required this.leadNeedMs,
    required this.tailNeedMs,
    required this.fitByPaddingMs,
    required this.realGaps,
    required this.joinedGaps,
    required this.usedAudio,
  });

  static const empty = PaddingRecommendation(
    paddingMs: 300,
    fillGaps: true,
    fillGapsMaxMs: 300,
    leadNeedMs: null,
    tailNeedMs: null,
    fitByPaddingMs: {},
    realGaps: 0,
    joinedGaps: 0,
    usedAudio: false,
  );
}

/// Рахує, наскільки можна розширити таймінг кожної фрази вперед/назад,
/// щоб анімації появи/зникнення встигали спрацювати.
PaddingRecommendation recommendPadding({
  required List<SpeechInterval> subtitles,
  int shiftMs = 0,
  List<AudioWindow> windows = const [],
  int animationMs = 200,
  int maxPaddingMs = 500,
  int fillGapsMaxMs = 300,
  double fitTarget = 0.85,
}) {
  if (subtitles.isEmpty) {
    return const PaddingRecommendation(
      paddingMs: 300,
      fillGaps: true,
      fillGapsMaxMs: 300,
      leadNeedMs: null,
      tailNeedMs: null,
      fitByPaddingMs: {},
      realGaps: 0,
      joinedGaps: 0,
      usedAudio: false,
    );
  }

  final subs = subtitles
      .map((s) => SpeechInterval(s.startMs + shiftMs, s.endMs + shiftMs))
      .toList()
    ..sort((a, b) => a.startMs.compareTo(b.startMs));

  // ---- 1. Паузи ----
  final gaps = <int>[];
  for (var i = 0; i < subs.length - 1; i++) {
    gaps.add(math.max(0, subs[i + 1].startMs - subs[i].endMs));
  }
  final joined = gaps.where((g) => g < fillGapsMaxMs).length;
  final real = gaps.where((g) => g >= fillGapsMaxMs).toList();

  final fit = <int, double>{};
  var cap = 300;
  for (var e = 0; e <= maxPaddingMs; e += 100) {
    final ratio = real.isEmpty ? 1.0 : real.where((g) => g >= 2 * e).length / real.length;
    fit[e] = ratio;
    if (ratio >= fitTarget) cap = math.max(cap, e);
  }
  final fillGaps = true;

  // ---- 2. Аудіо ----
  int? leadNeed, tailNeed;
  final leads = <int>[];
  final tails = <int>[];
  for (final w in windows) {
    for (final sp in w.speech) {
      if (sp.startMs < 300 || sp.endMs > w.lengthMs - 300) continue;
      final s = w.startMs + sp.startMs;
      final e = w.startMs + sp.endMs;
      SpeechInterval? first, last;
      for (final sub in subs) {
        if (sub.endMs <= s) continue;
        if (sub.startMs >= e) break;
        first ??= sub;
        last = sub;
      }
      if (first == null || last == null) continue;
      leads.add((first.startMs - s).clamp(0, 800).toInt());
      tails.add((e - last.endMs).clamp(0, 800).toInt());
    }
  }
  if (leads.isNotEmpty) {
    leadNeed = _roundTo100(_percentile(leads, 0.75));
    tailNeed = _roundTo100(_percentile(tails, 0.75));
  }

  // ---- 3. Підсумок ----
  final audioNeed = (leadNeed != null && tailNeed != null) ? math.max(leadNeed, tailNeed) : 300;
  final target = math.max(300, math.max(animationMs, audioNeed));
  final padding = _roundTo100(math.max(300, math.min(target, math.max(cap, 300)))).clamp(200, maxPaddingMs).toInt();

  return PaddingRecommendation(
    paddingMs: padding,
    fillGaps: fillGaps,
    fillGapsMaxMs: fillGapsMaxMs,
    leadNeedMs: leadNeed,
    tailNeedMs: tailNeed,
    fitByPaddingMs: fit,
    realGaps: real.length,
    joinedGaps: joined,
    usedAudio: leadNeed != null,
  );
}

int _percentile(List<int> values, double p) {
  final sorted = [...values]..sort();
  return sorted[((sorted.length - 1) * p).round()];
}

int _roundTo100(int x) => ((x + 50) ~/ 100) * 100;
