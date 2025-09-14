import 'package:hive/hive.dart';
part 'phrase_word_object.g.dart';

@HiveType(typeId: 4)
class PhraseWordObject extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  int? wordId;

  @HiveField(2)
  int position;

  @HiveField(3)
  int block;

  PhraseWordObject({
    required this.text,
    this.wordId,
    required this.position,
    required this.block,
  });
}