import 'package:pp_467/features/events/domain/entities/event/event.dart';

abstract class EventRepo {
  List<Event> getAll();
  Future<void> create(Event event);
  Future<void> update(Event event);
  Future<void> delete(Event event);
}
