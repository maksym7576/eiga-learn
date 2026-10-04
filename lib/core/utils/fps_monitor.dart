import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

class FpsMonitor {
  static final FpsMonitor _instance = FpsMonitor._internal();
  factory FpsMonitor() => _instance;
  FpsMonitor._internal();

  bool _isEnabled = false;
  int _frameCount = 0;
  int _jankCount = 0;
  final Stopwatch _stopwatch = Stopwatch();
  bool _isCallbackRegistered = false;

  bool get isEnabled => _isEnabled;

  void enable() {
    if (_isEnabled) return;
    _isEnabled = true;
    _frameCount = 0;
    _jankCount = 0;
    _stopwatch.reset();
    _stopwatch.start();

    if (!_isCallbackRegistered) {
      _isCallbackRegistered = true;
      SchedulerBinding.instance.addTimingsCallback(_handleTimings);
    }
    debugPrint('📊 [FpsMonitor] Enabled');
  }

  void disable() {
    if (!_isEnabled) return;
    _isEnabled = false;
    _stopwatch.stop();
    if (_isCallbackRegistered) {
      _isCallbackRegistered = false;
      SchedulerBinding.instance.removeTimingsCallback(_handleTimings);
    }
    debugPrint('📊 [FpsMonitor] Disabled');
  }

  void toggle() {
    if (_isEnabled) {
      disable();
    } else {
      enable();
    }
  }

  void _handleTimings(List<FrameTiming> timings) {
    if (!_isEnabled) return;

    _frameCount += timings.length;
    for (final timing in timings) {
      if (timing.totalSpan.inMilliseconds > 18) {
        _jankCount++;
      }
    }

    if (_stopwatch.elapsedMilliseconds >= 1000) {
      final fps = (_frameCount * 1000) / _stopwatch.elapsedMilliseconds;
      debugPrint('📊 [Terminal FPS] ${fps.toStringAsFixed(1)} FPS | Jank frames: $_jankCount');
      _frameCount = 0;
      _jankCount = 0;
      _stopwatch.reset();
      _stopwatch.start();
    }
  }
}

final fpsMonitor = FpsMonitor();
