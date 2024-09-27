import 'package:hive/hive.dart';

part 'subtask_priority.g.dart';

@HiveType(typeId: 0)
enum SubtaskPriority {
  @HiveField(0)
  high,
  @HiveField(1)
  medium,
  @HiveField(2)
  low,
}
