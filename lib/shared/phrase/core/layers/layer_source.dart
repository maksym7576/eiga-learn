sealed class LayerSource {
  const LayerSource();
}

class ReadingSource extends LayerSource {
  final String key; // 'original' | 'kana' | 'romaji' ...
  const ReadingSource(this.key);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadingSource && runtimeType == other.runtimeType && key == other.key;

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() => 'ReadingSource($key)';
}

class TranslationSource extends LayerSource {
  final String lang; // 'uk' | 'en' ...
  const TranslationSource(this.lang);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationSource && runtimeType == other.runtimeType && lang == other.lang;

  @override
  int get hashCode => lang.hashCode;

  @override
  String toString() => 'TranslationSource($lang)';
}
