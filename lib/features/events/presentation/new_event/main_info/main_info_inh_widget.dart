import 'package:flutter/material.dart';

class MainInfoInheritedWidget extends InheritedWidget {
  final TextEditingController titleController;
  final TextEditingController locationController;
  final TextEditingController descriptionController;
  final DateTime? dateTime;
  final ValueChanged<DateTime?> onDateTimeChanged;

  const MainInfoInheritedWidget({
    super.key,
    required super.child,
    required this.titleController,
    required this.locationController,
    required this.descriptionController,
    required this.dateTime,
    required this.onDateTimeChanged,
  });

  static MainInfoInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainInfoInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
