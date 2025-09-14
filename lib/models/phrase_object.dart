import 'package:hive/hive.dart';
import 'package:nihongona/models/phrase_word_object.dart';
part 'phrase_object.g.dart';
@HiveType(typeId: 2)
class PhraseObject extends HiveObject {
  @HiveField(0)
  int index;

  @HiveField(1)
  Duration? startTime;

  @HiveField(2)
  Duration? endTime;

  @HiveField(3)
  List<PhraseWordObject> words;

  @HiveField(4)
  List<PhraseWordObject>? translationBlocks;

  @HiveField(5)
  bool isActive;

  PhraseObject({
    required this.index,
    this.startTime,
    this.endTime,
    required this.words,
    this.translationBlocks,
    this.isActive = false,
  });

  PhraseObject copyWith({
    int? index,
    Duration? startTime,
    Duration? endTime,
    bool? isActive,
    List<PhraseWordObject>? words,
    List<PhraseWordObject>? translationBlocks,
  }) {
    return PhraseObject(
      index: index ?? this.index,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isActive: isActive ?? this.isActive,
      words: words ?? this.words,
      translationBlocks: translationBlocks ?? this.translationBlocks,
    );
  }
}
