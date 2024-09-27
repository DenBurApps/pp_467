import 'package:hive_flutter/hive_flutter.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/domain/entities/subtask_priority/subtask_priority.dart';

class DatabaseService {
  late Box<Event> events;

  Future<DatabaseService> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SubtaskPriorityAdapter());
    Hive.registerAdapter(SubtaskAdapter());
    Hive.registerAdapter(GuestAdapter());
    Hive.registerAdapter(ExpenseAdapter());
    Hive.registerAdapter(EventAdapter());

    events = await Hive.openBox('events');
    return this;
  }
}
