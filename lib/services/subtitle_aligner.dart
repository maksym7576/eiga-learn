import 'dart:math' as math;
import 'dart:typed_data';

/// Інтервал мовлення в мілісекундах.
class SpeechInterval {
  final int startMs;
  final int endMs;
  const SpeechInterval(this.startMs, this.endMs);
  int get lengthMs => endMs - startMs;
}

/// Об'єднує інтервали, між якими пауза <= maxGapMs, і відкидає коротші за minLenMs.
List<SpeechInterval> mergeIntervals(
  List<SpeechInterval> input, {
  required int maxGapMs,
  int minLenMs = 0,
}) {
  if (input.isEmpty) return const [];
  final sorted = [...input]..sort((a, b) => a.startMs.compareTo(b.startMs));
  final merged = <SpeechInterval>[];
  var cur = sorted.first;
  for (final next in sorted.skip(1)) {
    if (next.startMs - cur.endMs <= maxGapMs) {
      cur = SpeechInterval(cur.startMs, math.max(cur.endMs, next.endMs));
    } else {
      merged.add(cur);
      cur = next;
    }
  }
  merged.add(cur);
  return merged.where((i) => i.lengthMs >= minLenMs).toList();
}

/// Шматок відео, для якого ми вже знаємо де є мовлення (VAD).
/// [speech] — інтервали ВІДНОСНО початку вікна.
class AudioWindow {
  final int startMs; // абсолютний час початку вікна у відео
  final int lengthMs;
  final List<SpeechInterval> speech;
  const AudioWindow({
    required this.startMs,
    required this.lengthMs,
    required this.speech,
  });
}

class AlignmentResult {
  /// Скільки мс треба ДОДАТИ до часу кожного субтитру (може бути від'ємним).
  final int offsetMs;

  /// 0..99
  final int confidence;

  /// Кореляція Пірсона в піку (0..1).
  final double peakScore;

  /// Наскільки пік вирізняється на фоні (в стандартних відхиленнях).
  final double zScore;

  /// Відхилення оптимального зсуву в кожному вікні від глобального (дрейф/різні нарізки).
  final List<int> windowDeltasMs;
  final int driftMs;
  final int usableWindows;

  const AlignmentResult({
    required this.offsetMs,
    required this.confidence,
    required this.peakScore,
    required this.zScore,
    required this.windowDeltasMs,
    required this.driftMs,
    required this.usableWindows,
  });

  static const failed = AlignmentResult(
    offsetMs: 0,
    confidence: 0,
    peakScore: 0,
    zScore: 0,
    windowDeltasMs: [],
    driftMs: 0,
    usableWindows: 0,
  );
}

/// Знаходить зсув субтитрів, при якому вони найкраще збігаються з реальним мовленням.
///
/// Алгоритм: двійковий сигнал "є мовлення" з аудіо (VAD) порівнюється з двійковим
/// сигналом "є субтитр" при різних зсувах (крос-кореляція Пірсона).
/// Спочатку грубо (крок 100 мс, ±maxShiftMs), потім точно (крок 20 мс).
AlignmentResult alignSubtitles({
  required List<AudioWindow> windows,
  required List<SpeechInterval> subtitles,
  int maxShiftMs = 120000,
}) {
  final usable = windows.where((w) => w.speech.length >= 5).toList();
  if (usable.isEmpty || subtitles.isEmpty) return AlignmentResult.failed;

  // ---------- 1. Грубий пошук ----------
  const coarseBin = 100;
  final coarseRange = (maxShiftMs ~/ coarseBin) * coarseBin;
  final rc = coarseRange ~/ coarseBin;
  final coarse = _averageCurves(usable, subtitles, 0, coarseRange, coarseBin);

  var best = 0;
  for (var i = 1; i < coarse.length; i++) {
    if (coarse[i] > coarse[best]) best = i;
  }
  final coarseOffset = (best - rc) * coarseBin;

  // Фон кривої (без ±1.5 с навколо піку) — щоб оцінити, наскільки пік виразний.
  double sum = 0, sumSq = 0;
  var cnt = 0;
  for (var i = 0; i < coarse.length; i++) {
    if ((i - best).abs() <= 15) continue;
    sum += coarse[i];
    sumSq += coarse[i] * coarse[i];
    cnt++;
  }
  double z = 0;
  if (cnt > 10) {
    final mean = sum / cnt;
    final std = math.sqrt(math.max(sumSq / cnt - mean * mean, 1e-12));
    z = (coarse[best] - mean) / std;
  }

  // ---------- 2. Точний пошук ----------
  const fineBin = 20;
  const fineRange = 200;
  const rf = fineRange ~/ fineBin;
  final fine = _averageCurves(usable, subtitles, coarseOffset, fineRange, fineBin);
  var bestF = 0;
  for (var i = 1; i < fine.length; i++) {
    if (fine[i] > fine[bestF]) bestF = i;
  }
  final offset = coarseOffset + (bestF - rf) * fineBin;
  final peak = fine[bestF];

  // ---------- 3. Перевірка по вікнах (дрейф / стабільність) ----------
  final center = (offset / 100).round() * 100;
  const driftRange = 3000;
  const rd = driftRange ~/ 100;
  final deltas = <int>[];
  for (final w in usable) {
    final c = _corrCurve(w, subtitles, centerMs: center, rangeMs: driftRange, binMs: 100);
    var b = 0;
    for (var i = 1; i < c.length; i++) {
      if (c[i] > c[b]) b = i;
    }
    deltas.add(center + (b - rd) * 100 - offset);
  }
  final consistent = deltas.where((d) => d.abs() <= 400).length / deltas.length;
  final drift = deltas.reduce(math.max) - deltas.reduce(math.min);

  // ---------- 4. Впевненість ----------
  final strength = (peak / 0.45).clamp(0.0, 1.0).toDouble();
  final prominence = ((z - 3) / 9).clamp(0.0, 1.0).toDouble();
  final conf = (100 * (0.4 * strength + 0.4 * prominence + 0.2 * consistent))
      .round()
      .clamp(0, 99)
      .toInt();

  return AlignmentResult(
    offsetMs: offset,
    confidence: conf,
    peakScore: peak,
    zScore: z,
    windowDeltasMs: deltas,
    driftMs: drift,
    usableWindows: usable.length,
  );
}

List<double> _averageCurves(
  List<AudioWindow> windows,
  List<SpeechInterval> subs,
  int centerMs,
  int rangeMs,
  int binMs,
) {
  List<double>? acc;
  for (final w in windows) {
    final c = _corrCurve(w, subs, centerMs: centerMs, rangeMs: rangeMs, binMs: binMs);
    acc ??= List<double>.filled(c.length, 0);
    for (var i = 0; i < c.length; i++) {
      acc[i] += c[i];
    }
  }
  for (var i = 0; i < acc!.length; i++) {
    acc[i] /= windows.length;
  }
  return acc;
}

/// Кореляція Пірсона між аудіо-мовленням у вікні та субтитрами, зсунутими на
/// offset = centerMs + (idx - R) * binMs, idx = 0..2R, R = rangeMs / binMs.
List<double> _corrCurve(
  AudioWindow w,
  List<SpeechInterval> subs, {
  required int centerMs,
  required int rangeMs,
  required int binMs,
}) {
  final r = rangeMs ~/ binMs;
  final na = (w.lengthMs + binMs - 1) ~/ binMs;
  final ns = na + 2 * r + 2;
  // Субтитр з оригінальним часом t потрапляє у відео в t + offset.
  final sStart = w.startMs - centerMs - r * binMs;

  // Аудіо-растр.
  final a = Uint8List(na);
  for (final iv in w.speech) {
    final from = math.max(0, iv.startMs ~/ binMs);
    final to = math.min(na, (iv.endMs + binMs - 1) ~/ binMs);
    for (var i = from; i < to; i++) {
      a[i] = 1;
    }
  }
  final active = <int>[];
  for (var i = 0; i < na; i++) {
    if (a[i] == 1) active.add(i);
  }
  if (active.isEmpty) return List<double>.filled(2 * r + 1, 0);

  // Растр субтитрів (оригінальні часи) + префіксні суми.
  final s = Uint8List(ns);
  for (final iv in subs) {
    final e = iv.endMs - sStart;
    if (e <= 0) continue;
    final st = iv.startMs - sStart;
    if (st >= ns * binMs) continue;
    final from = st < 0 ? 0 : st ~/ binMs;
    final to = math.min(ns, (e + binMs - 1) ~/ binMs);
    for (var i = from; i < to; i++) {
      s[i] = 1;
    }
  }
  final prefix = Int32List(ns + 1);
  for (var i = 0; i < ns; i++) {
    prefix[i + 1] = prefix[i] + s[i];
  }

  final pa = active.length / na;
  final out = List<double>.filled(2 * r + 1, 0);
  for (var idx = 0; idx <= 2 * r; idx++) {
    final lo = 2 * r - idx;
    var c = 0;
    for (final i in active) {
      c += s[i + lo];
    }
    final sumS = prefix[lo + na] - prefix[lo];
    final ps = sumS / na;
    final denom = math.sqrt(pa * (1 - pa) * ps * (1 - ps));
    out[idx] = denom > 1e-9 ? (c / na - pa * ps) / denom : 0;
  }
  return out;
}
