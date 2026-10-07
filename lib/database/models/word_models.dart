enum WordStatus {
  none(''),
  unknown('Не знаю'),
  learning('Вчу'),
  known('Знаю');

  const WordStatus(this.label);
  final String label;
}

enum TokenKind { plain, main, pattern }
enum TokenField { original, kana, romaji }
enum TrKind { plain, italic, highlight }

class Token {
  const Token(this.original, this.kana, this.romaji, [this.kind = TokenKind.plain]);
  final String original, kana, romaji;
  final TokenKind kind;

  String pick(TokenField f) => switch (f) {
        TokenField.original => original,
        TokenField.kana => kana,
        TokenField.romaji => romaji,
      };
}

class TrPart {
  const TrPart(this.text, [this.kind = TrKind.plain]);
  final String text;
  final TrKind kind;
}

class GrammarPattern {
  const GrammarPattern(this.pattern, this.title, this.level, this.description);
  final String pattern, title, level, description;
}

class Example {
  const Example({
    required this.label,
    required this.source,
    required this.time,
    required this.tokens,
    required this.translation,
    required this.chips,
    required this.meaning,
    this.pattern,
  });
  final String label, source, time, meaning;
  final List<Token> tokens;
  final List<TrPart> translation;
  final List<String> chips;
  final GrammarPattern? pattern;
}

class WordForm {
  const WordForm(this.text, this.label, this.count, {this.kana, this.romaji});
  final String text, label;
  final int count;
  final String? kana;
  final String? romaji;
}

class MeaningCount {
  const MeaningCount(this.text, this.count);
  final String text;
  final int count;
}

class WordEntry {
  const WordEntry({
    required this.key,
    required this.original,
    required this.kana,
    required this.romaji,
    required this.pos,
    this.jlpt,
    this.note,
    this.translation,
    this.occurrences = 0,
    this.videos = 0,
    this.forms = const [],
    this.meanings = const [],
    this.synonyms = const [],
    this.antonyms = const [],
    this.examples = const [],
  });

  final String key, original, kana, romaji, pos;
  final String? jlpt, note, translation;
  final int occurrences, videos;
  final List<WordForm> forms;
  final List<MeaningCount> meanings;
  final List<String> synonyms, antonyms;
  final List<Example> examples;
}
