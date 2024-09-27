import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/presentation/new_event/tasks_setup/subtask_form_entry.dart';
import 'package:pp_467/features/events/presentation/new_event/tasks_setup/tasks_setup_inh_widget.dart';
import 'package:pp_467/gen/assets.gen.dart';
import 'package:uuid/v4.dart';

class TasksSetupContent extends StatefulWidget {
  final String submitButtonTitle;
  final VoidCallback submitButtonCallback;
  const TasksSetupContent({
    super.key,
    required this.submitButtonTitle,
    required this.submitButtonCallback,
  });

  @override
  State<TasksSetupContent> createState() => _TasksSetupContentState();
}

class _TasksSetupContentState extends State<TasksSetupContent> {
  @override
  Widget build(BuildContext context) {
    final inherited = TasksSetupInheritedWidget.of(context);
    if (inherited == null) return const SizedBox.shrink();
    return Section(
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: inherited.subtasks.length,
            itemBuilder: (context, index) {
              final subtask = inherited.subtasks.reversed.toList()[index];
              return SubtaskFormEntry(
                subtask: subtask,
                subtaskList: inherited.subtasks,
                onUpdated: (newSubtask) => setState(
                  () => inherited.subtasks[index] = newSubtask,
                ),
                onDeleted: () => setState(
                  () => inherited.subtasks.remove(subtask),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 40,
              color: context.colors.primary,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                child: SvgIcon(
                  Assets.icons.addRounded,
                  side: 34,
                ),
                onPressed: () => setState(
                  () => inherited.subtasks.add(
                    Subtask(
                      uuid: const UuidV4().generate(),
                      title: '',
                      description: '',
                      done: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: CustomButton.title(
                  title: widget.submitButtonTitle,
                  onPressed: widget.submitButtonCallback,
                  active: inherited.subtasks
                      .where((e) =>
                          e.title.isEmpty ||
                          e.date == null ||
                          e.priority == null)
                      .isEmpty,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
