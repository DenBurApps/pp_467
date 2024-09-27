import 'package:flutter/material.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';

class TasksSetupInheritedWidget extends InheritedWidget {
  final List<Subtask> subtasks;

  const TasksSetupInheritedWidget({
    super.key,
    required super.child,
    required this.subtasks,
  });

  static TasksSetupInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksSetupInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
