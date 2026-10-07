import '../models/word_models.dart';

class WordCardResponseDto {
  final List<WordCardItemDto> items;
  final int totalCount;

  const WordCardResponseDto({
    required this.items,
    required this.totalCount,
  });
}

class WordCardItemDto {
  final String lemmaKey;
  final String original;
  final String kana;
  final String romaji;
  final String pos;
  final String? jlpt;
  final String? note;
  final String? translation;
  final WordStatus status;
  final DateTime? updatedAt;
  final List<String> synonyms;
  final List<String> antonyms;

  const WordCardItemDto({
    required this.lemmaKey,
    required this.original,
    required this.kana,
    required this.romaji,
    required this.pos,
    this.jlpt,
    this.note,
    this.translation,
    required this.status,
    this.updatedAt,
    this.synonyms = const [],
    this.antonyms = const [],
  });
}
