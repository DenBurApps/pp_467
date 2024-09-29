import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/new_event/tasks_setup/subtask_form_entry.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class AddSubtaskScreen extends StatefulWidget {
  final Event event;
  final Subtask? subtask;
  const AddSubtaskScreen({
    super.key,
    required this.event,
    this.subtask,
  });

  @override
  State<AddSubtaskScreen> createState() => _AddSubtaskScreenState();
}

class _AddSubtaskScreenState extends State<AddSubtaskScreen> {
  Subtask _subtask = Subtask(
    uuid: const UuidV4().generate(),
    title: '',
    description: '',
    done: false,
  );

  @override
  void initState() {
    super.initState();
    if (widget.subtask != null) {
      _subtask = widget.subtask!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceBright,
      appBar: AppBar(
        leadingWidth: 20 + 24 + 20,
        leading: const CustomBackButton(),
        title: Text(
          'Add subtask',
          style: context.text.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: context.colors.surfaceDim,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Section(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SubtaskFormEntry(
                    subtask: _subtask,
                    subtaskList: const [],
                    onUpdated: (newSubtask) =>
                        setState(() => _subtask = newSubtask),
                    onDeleted: () {},
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 56),
                    child: CustomButton.title(
                      title: 'Save',
                      onPressed: () async {
                        final cubit = context.read<EventCubit>();
                        final router = context.router;
                        if (widget.subtask == null) {
                          await cubit.addSubtask(
                            event: widget.event,
                            subtask: _subtask,
                          );
                        } else {
                          await cubit.updateSubtask(
                            event: widget.event,
                            subtask: _subtask,
                          );
                        }
                        router.popForced();
                      },
                      active: _subtask.title.isNotEmpty &&
                          _subtask.date != null &&
                          _subtask.priority != null,
                      color: context.colors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
