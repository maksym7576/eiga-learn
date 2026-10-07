import 'package:eiga/database/models/word_models.dart';

const _s1 = 'Sousou no Frieren';

const sampleWords = <String, WordEntry>{
  '食べる|verb': WordEntry(
    key: '食べる|verb', original: '食べる', kana: 'たべる', romaji: 'taberu', pos: 'дієслово', jlpt: 'N5',
    translation: 'їсти, поїсти, обідати', occurrences: 14, videos: 3,
    forms: [
      WordForm('食べました', 'минула ввічлива', 3, kana: 'たべました', romaji: 'tabemashita'),
      WordForm('食べます', 'ввічлива', 4, kana: 'たべます', romaji: 'tabemasu'),
    ],
    meanings: [MeaningCount('пообідати', 1), MeaningCount('поїсти', 1), MeaningCount('їсти', 1)],
    synonyms: ['召し上がる|verb', '食う|verb'],
    antonyms: ['飲む|verb'],
    examples: [
      Example(
        label: 'S1E1', source: '$_s1 · S1E1', time: '12:31',
        tokens: [
          Token('昼ご飯', 'ひるごはん', 'hirugohan'),
          Token('を', 'を', 'o'),
          Token('食べました', 'たべました', 'tabemashita', TokenKind.main),
          Token('。', '。', '.'),
        ],
        translation: [TrPart('Я', TrKind.italic), TrPart(' '), TrPart('пообідав', TrKind.highlight), TrPart('.')],
        chips: ['минула ввічлива', 'присудок'], meaning: 'пообідати',
        pattern: GrammarPattern('〜ました', 'Ввічлива минула форма', 'N5', 'До основи дієслова додається ました: 食べ → 食べました.'),
      ),
    ],
  ),
  '飲む|verb': WordEntry(
    key: '飲む|verb', original: '飲む', kana: 'のむ', romaji: 'nomu', pos: 'дієслово', jlpt: 'N5',
    translation: 'пити', occurrences: 9, videos: 2,
    forms: [
      WordForm('飲みました', 'минула ввічлива', 6, kana: 'のみました', romaji: 'nomimashita'),
      WordForm('飲む', 'словникова', 3, kana: 'のむ', romaji: 'nomu'),
    ],
    meanings: [MeaningCount('пити', 2)],
    antonyms: ['食べる|verb'],
    examples: [
      Example(
        label: 'S1E2', source: '$_s1 · S1E2', time: '07:20',
        tokens: [
          Token('水', 'みず', 'mizu'),
          Token('を', 'を', 'o'),
          Token('飲みました', 'のみました', 'nomimashita', TokenKind.main),
          Token('。', '。', '.'),
        ],
        translation: [TrPart('Я', TrKind.italic), TrPart(' '), TrPart('випив', TrKind.highlight), TrPart(' '), TrPart('води'), TrPart('.')],
        chips: ['минула ввічлива', 'присудок'], meaning: 'пити',
      ),
    ],
  ),
};
