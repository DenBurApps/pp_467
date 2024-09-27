// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_priority.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubtaskPriorityAdapter extends TypeAdapter<SubtaskPriority> {
  @override
  final int typeId = 0;

  @override
  SubtaskPriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SubtaskPriority.high;
      case 1:
        return SubtaskPriority.medium;
      case 2:
        return SubtaskPriority.low;
      default:
        return SubtaskPriority.high;
    }
  }

  @override
  void write(BinaryWriter writer, SubtaskPriority obj) {
    switch (obj) {
      case SubtaskPriority.high:
        writer.writeByte(0);
        break;
      case SubtaskPriority.medium:
        writer.writeByte(1);
        break;
      case SubtaskPriority.low:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubtaskPriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
