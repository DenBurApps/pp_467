// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubtaskAdapter extends TypeAdapter<Subtask> {
  @override
  final int typeId = 1;

  @override
  Subtask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subtask(
      uuid: fields[0] as String,
      title: fields[1] as String,
      date: fields[2] as DateTime?,
      description: fields[3] as String,
      priority: fields[4] as SubtaskPriority?,
      done: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Subtask obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubtaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
