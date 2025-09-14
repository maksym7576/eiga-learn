// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_word_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhraseWordObjectAdapter extends TypeAdapter<PhraseWordObject> {
  @override
  final int typeId = 4;

  @override
  PhraseWordObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhraseWordObject(
      text: fields[0] as String,
      wordId: fields[1] as int?,
      position: fields[2] as int,
      block: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PhraseWordObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.wordId)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.block);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhraseWordObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
