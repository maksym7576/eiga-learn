// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhraseObjectAdapter extends TypeAdapter<PhraseObject> {
  @override
  final int typeId = 2;

  @override
  PhraseObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhraseObject(
      index: fields[0] as int,
      startTime: fields[1] as Duration?,
      endTime: fields[2] as Duration?,
      words: (fields[3] as List).cast<PhraseWordObject>(),
      translationBlocks: (fields[4] as List?)?.cast<PhraseWordObject>(),
      isActive: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PhraseObject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.words)
      ..writeByte(4)
      ..write(obj.translationBlocks)
      ..writeByte(5)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhraseObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
