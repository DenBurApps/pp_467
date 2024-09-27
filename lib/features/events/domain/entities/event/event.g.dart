// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 4;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      uuid: fields[0] as String,
      title: fields[1] as String,
      dateTime: fields[2] as DateTime,
      location: fields[3] as String,
      description: fields[4] as String,
      imagePath: fields[5] as String,
      subtasks: (fields[6] as List).cast<Subtask>(),
      guests: (fields[7] as List).cast<Guest>(),
      expenses: (fields[8] as List).cast<Expense>(),
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.imagePath)
      ..writeByte(6)
      ..write(obj.subtasks)
      ..writeByte(7)
      ..write(obj.guests)
      ..writeByte(8)
      ..write(obj.expenses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
