import 'package:hive/hive.dart';
part 'subtitle_object.g.dart';

@HiveType(typeId: 0)
class SubtitleObject extends HiveObject {
  @HiveField(0)
  int? index;

  @HiveField(1)
  Duration? startTime;

  @HiveField(2)
  Duration? endTime;

  @HiveField(3)
  String? text;

  SubtitleObject({
    this.index,
    this.startTime,
    this.endTime,
    this.text,
  });

  SubtitleObject copyWith({
    int? index,
    Duration? startTime,
    Duration? endTime,
    String? text,
  }) {
    return SubtitleObject(
      index: index ?? this.index,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      text: text ?? this.text,
    );
  }

  static SubtitleObject fromMap({
    required int index,
    required Duration startTime,
    required Duration endTime,
    required String text,
  }) {
    return SubtitleObject(
      index: index,
      startTime: startTime,
      endTime: endTime,
      text: text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'startTime': startTime,
      'endTime': endTime,
      'text': text,
    };
  }
}