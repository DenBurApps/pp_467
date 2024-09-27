import 'package:hive/hive.dart';
import 'package:pp_467/features/events/data/event_repo.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';

class EventRepoImpl implements EventRepo {
  final Box<Event> box;

  EventRepoImpl(this.box);

  @override
  Future<void> create(Event event) async {
    return box.put(event.uuid, event);
  }

  @override
  Future<void> delete(Event event) async {
    return box.delete(event.uuid);
  }

  @override
  List<Event> getAll() {
    return box.values.toList();
  }

  @override
  Future<void> update(Event event) async {
    return box.put(event.uuid, event);
  }
}
