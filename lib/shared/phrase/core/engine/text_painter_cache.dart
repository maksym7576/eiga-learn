import 'package:flutter/material.dart';

class TextPainterKey {
  final String text;
  final TextStyle style;
  final TextDirection textDirection;

  const TextPainterKey(this.text, this.style, this.textDirection);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextPainterKey &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          style == other.style &&
          textDirection == other.textDirection;

  @override
  int get hashCode => Object.hash(text, style, textDirection);
}

class TextPainterCache {
  static final Map<TextPainterKey, TextPainter> _cache = {};
  static const int _maxSize = 300;

  static TextPainter get({
    required String text,
    required TextStyle style,
    required TextDirection textDirection,
  }) {
    final key = TextPainterKey(text, style, textDirection);

    if (_cache.containsKey(key)) {
      return _cache[key]!;
    }

    if (_cache.length >= _maxSize) {
      _cache.remove(_cache.keys.first);
    }

    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection,
    )..layout();

    _cache[key] = tp;
    return tp;
  }

  static void clear() => _cache.clear();
}
