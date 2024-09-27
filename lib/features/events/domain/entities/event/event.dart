import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';

part 'event.g.dart';
part 'event.freezed.dart';

@freezed
@HiveType(typeId: 4)
class Event with _$Event {
  const factory Event({
    @HiveField(0) required String uuid,
    @HiveField(1) required String title,
    @HiveField(2) required DateTime dateTime,
    @HiveField(3) required String location,
    @HiveField(4) required String description,
    @HiveField(5) required String imagePath,
    @HiveField(6) required List<Subtask> subtasks,
    @HiveField(7) required List<Guest> guests,
    @HiveField(8) required List<Expense> expenses,
  }) = _Event;
}
