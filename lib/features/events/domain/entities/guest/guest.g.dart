// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GuestAdapter extends TypeAdapter<Guest> {
  @override
  final int typeId = 2;

  @override
  Guest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Guest(
      uuid: fields[0] as String,
      name: fields[1] as String,
      contacts: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Guest obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.contacts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
