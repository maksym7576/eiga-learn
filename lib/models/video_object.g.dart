// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class videoobjectAdapter extends TypeAdapter<video_object> {
  @override
  final int typeId = 0;

  @override
  video_object read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return video_object(
      name: fields[0] as String?,
      videoPath: fields[1] as String,
      srtPath: fields[2] as String?,
      createdAt: fields[3] as DateTime?,
      thumbnailPath: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, video_object obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.videoPath)
      ..writeByte(2)
      ..write(obj.srtPath)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.thumbnailPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is videoobjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
