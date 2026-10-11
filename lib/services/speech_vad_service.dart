import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'subtitle_aligner.dart' show SpeechInterval, mergeIntervals;

/// Реальний детектор мовлення для 16 kHz mono PCM16 WAV.
/// Адаптивний енергетичний VAD: смуговий фільтр ~150..3400 Гц, поріг рахується
/// від рівня шуму/піків самого фрагмента, гістерезис, склейка пауз.
///
/// Інтерфейс (WAV -> інтервали) не залежить від реалізації, тому пізніше
/// сюди можна підключити справжній Silero VAD (onnxruntime) без змін в решті коду.
class SpeechVadService {
  static const int sampleRate = 16000;

  /// [sensitivity] 0..1 (більше = ловить тихіше мовлення, але більше шуму).
  /// Повертає інтервали в мс ВІДНОСНО початку файлу.
  Future<List<SpeechInterval>> detectSpeech({
    required String wavPath,
    double sensitivity = 0.5,
  }) async {
    final file = File(wavPath);
    if (!await file.exists()) {
      developer.log('WAV not found: $wavPath', name: 'SpeechVadService');
      return const [];
    }
    final bytes = await file.readAsBytes();
    final samples = _readPcm16(bytes);
    if (samples == null || samples.length < sampleRate) {
      developer.log('Invalid/short WAV: $wavPath', name: 'SpeechVadService');
      return const [];
    }
    final result = await compute(_detect, _VadArgs(samples, sensitivity));
    developer.log('VAD: ${result.length} speech intervals', name: 'SpeechVadService');
    return result;
  }

  /// Акуратно шукає чанк 'data' (FFmpeg може додати LIST-чанк, тож 44 байти не гарантовані).
  Int16List? _readPcm16(Uint8List bytes) {
    if (bytes.length < 44) return null;
    if (String.fromCharCodes(bytes, 0, 4) != 'RIFF') return null;
    final bd = ByteData.sublistView(bytes);
    var pos = 12;
    var dataStart = -1;
    var dataLen = 0;
    while (pos + 8 <= bytes.length) {
      final id = String.fromCharCodes(bytes, pos, pos + 4);
      final size = bd.getUint32(pos + 4, Endian.little);
      if (id == 'data') {
        dataStart = pos + 8;
        dataLen = size;
        break;
      }
      pos += 8 + size + (size & 1);
    }
    if (dataStart < 0) return null;
    final avail = bytes.length - dataStart;
    if (dataLen == 0 || dataLen > avail) dataLen = avail;
    final n = dataLen ~/ 2;
    final out = Int16List(n);
    for (var i = 0; i < n; i++) {
      out[i] = bd.getInt16(dataStart + i * 2, Endian.little);
    }
    return out;
  }
}

class _VadArgs {
  final Int16List samples;
  final double sensitivity;
  const _VadArgs(this.samples, this.sensitivity);
}

List<SpeechInterval> _detect(_VadArgs args) {
  const frameLen = 320; // 20 мс @ 16 kHz
  const frameMs = 20;
  const hpA = 0.943; // high-pass ~150 Гц
  const lpAlpha = 0.737; // low-pass ~3.4 кГц

  final s = args.samples;
  final n = s.length ~/ frameLen;
  if (n < 50) return const [];

  // 1. Енергія кожного 20 мс кадру (дБ) після смугового фільтра.
  final energy = List<double>.filled(n, 0);
  double prevIn = 0, prevHp = 0, lp = 0;
  for (var f = 0; f < n; f++) {
    double sum = 0;
    final base = f * frameLen;
    for (var i = 0; i < frameLen; i++) {
      final x = s[base + i] / 32768.0;
      final hp = hpA * (prevHp + x - prevIn);
      prevIn = x;
      prevHp = hp;
      lp += lpAlpha * (hp - lp);
      sum += lp * lp;
    }
    final rms = math.sqrt(sum / frameLen);
    energy[f] = 20 * math.log(rms + 1e-6) / math.ln10;
  }

  // 2. Медіанне згладжування (5 кадрів).
  final sm = List<double>.filled(n, 0);
  for (var i = 0; i < n; i++) {
    final w = <double>[];
    for (var j = math.max(0, i - 2); j <= math.min(n - 1, i + 2); j++) {
      w.add(energy[j]);
    }
    w.sort();
    sm[i] = w[w.length ~/ 2];
  }

  // 3. Адаптивні пороги.
  final sorted = [...sm]..sort();
  final floor = sorted[(n * 0.10).floor()];
  final ceil = sorted[math.min(n - 1, (n * 0.95).floor())];
  if (ceil < -55 || ceil - floor < 6) return const []; // тиша або плоский сигнал

  final sens = args.sensitivity.clamp(0.0, 1.0);
  final hiFrac = 0.55 - 0.3 * sens;
  final loFrac = math.max(0.1, hiFrac - 0.12);
  final hi = floor + (ceil - floor) * hiFrac;
  final lo = floor + (ceil - floor) * loFrac;

  // 4. Гістерезис.
  final raw = <SpeechInterval>[];
  var active = false;
  var start = 0;
  for (var i = 0; i < n; i++) {
    final e = sm[i];
    if (!active && e >= hi) {
      active = true;
      start = i;
      while (start > 0 && sm[start - 1] >= lo) {
        start--;
      }
    } else if (active && e < lo) {
      raw.add(SpeechInterval(start * frameMs, i * frameMs));
      active = false;
    }
  }
  if (active) raw.add(SpeechInterval(start * frameMs, n * frameMs));

  // 5. Склейка коротких пауз, відкидання щигликів.
  return mergeIntervals(raw, maxGapMs: 250, minLenMs: 200);
}
