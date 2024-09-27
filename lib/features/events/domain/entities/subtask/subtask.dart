import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pp_467/features/events/domain/entities/subtask_priority/subtask_priority.dart';

part 'subtask.g.dart';
part 'subtask.freezed.dart';

@freezed
@HiveType(typeId: 1)
class Subtask with _$Subtask {
  const factory Subtask({
    @HiveField(0) required String uuid,
    @HiveField(1) required String title,
    @HiveField(2) DateTime? date,
    @HiveField(3) required String description,
    @HiveField(4) SubtaskPriority? priority,
    @HiveField(5) required bool done,
  }) = _Subtask;
}
