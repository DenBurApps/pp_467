import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:pp_467/core/services/image_service.dart';
import 'package:pp_467/features/events/data/event_repo.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';

class EventCubit extends Cubit<List<Event>> {
  final EventRepo repo;
  final ImageService imageService;

  EventCubit({
    required this.repo,
    required this.imageService,
  }) : super([]) {
    readAll();
  }

  Future<Event> create({required Event event, required XFile image}) async {
    String? imagePath;

    imagePath = await imageService.saveImage(image);
    event = event.copyWith(imagePath: imagePath ?? '');

    await repo.create(event);
    emit([...state, event]);
    return event;
  }

  Future<void> readAll() async {
    final events = repo.getAll();
    emit(events);
  }

  Future<Event> update({required Event event, required XFile? newImage}) async {
    String? updatedImagePath = event.imagePath;

    if (newImage != null) {
      if (event.imagePath != basename(newImage.path)) {
        await imageService.deleteImage(event.imagePath);
        updatedImagePath = await imageService.saveImage(newImage);
      }
    }

    event = event.copyWith(imagePath: updatedImagePath ?? '');
    await repo.update(event);

    final updatedState =
        state.map((t) => t.uuid == event.uuid ? event : t).toList();
    emit(updatedState);
    return event;
  }

  Future<void> delete({required Event event}) async {
    // Delete the associated image
    if (event.imagePath.isNotEmpty) {
      await imageService.deleteImage(event.imagePath);
    }

    await repo.delete(event);
    final updatedState = state.where((t) => t.uuid != event.uuid).toList();
    emit(updatedState);
  }

  // Subtasks management
  Future<void> addSubtask(
      {required Event event, required Subtask subtask}) async {
    final updatedEvent = event.copyWith(subtasks: [...event.subtasks, subtask]);
    await update(
        event: updatedEvent, newImage: null); // Use existing update method
  }

  Future<void> updateSubtask(
      {required Event event, required Subtask subtask}) async {
    final updatedSubtasks = event.subtasks
        .map((t) => t.uuid == subtask.uuid ? subtask : t)
        .toList();
    final updatedEvent = event.copyWith(subtasks: updatedSubtasks);
    await update(event: updatedEvent, newImage: null);
  }

  Future<void> deleteSubtask(
      {required Event event, required Subtask subtask}) async {
    final updatedSubtasks =
        event.subtasks.where((t) => t.uuid != subtask.uuid).toList();
    final updatedEvent = event.copyWith(subtasks: updatedSubtasks);
    await update(event: updatedEvent, newImage: null);
  }

  // Guests management
  Future<void> addGuest({required Event event, required Guest guest}) async {
    final updatedEvent = event.copyWith(guests: [...event.guests, guest]);
    await update(event: updatedEvent, newImage: null);
  }

  Future<void> updateGuest({required Event event, required Guest guest}) async {
    final updatedGuests =
        event.guests.map((g) => g.uuid == guest.uuid ? guest : g).toList();
    final updatedEvent = event.copyWith(guests: updatedGuests);
    await update(event: updatedEvent, newImage: null);
  }

  Future<void> deleteGuest({required Event event, required Guest guest}) async {
    final updatedGuests =
        event.guests.where((g) => g.uuid != guest.uuid).toList();
    final updatedEvent = event.copyWith(guests: updatedGuests);
    await update(event: updatedEvent, newImage: null);
  }

  // Expenses management
  Future<void> addExpense(
      {required Event event, required Expense expense}) async {
    final updatedEvent = event.copyWith(expenses: [...event.expenses, expense]);
    await update(event: updatedEvent, newImage: null);
  }

  Future<void> updateExpense(
      {required Event event, required Expense expense}) async {
    final updatedExpenses = event.expenses
        .map((e) => e.uuid == expense.uuid ? expense : e)
        .toList();
    final updatedEvent = event.copyWith(expenses: updatedExpenses);
    await update(event: updatedEvent, newImage: null);
  }

  Future<void> deleteExpense(
      {required Event event, required Expense expense}) async {
    final updatedExpenses =
        event.expenses.where((e) => e.uuid != expense.uuid).toList();
    final updatedEvent = event.copyWith(expenses: updatedExpenses);
    await update(event: updatedEvent, newImage: null);
  }
}
