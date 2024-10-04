import 'package:flutter/material.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';

class GuestsInheritedWidget extends InheritedWidget {
  final List<Guest> guests;

  const GuestsInheritedWidget({
    super.key,
    required super.child,
    required this.guests,
  });

  static GuestsInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GuestsInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
