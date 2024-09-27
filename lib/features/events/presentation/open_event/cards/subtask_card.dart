import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/string_extension.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/ui_kit/edit_or_delete_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/core/ui_kit/white_bordered_chip.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/gen/assets.gen.dart';

class SubtaskCard extends StatelessWidget {
  final Event event;
  final Subtask subtask;
  const SubtaskCard({
    super.key,
    required this.event,
    required this.subtask,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtask.title,
                  style: context.text.displaySmall,
                ),
                const SizedBox(height: 10),
                WhiteBorderedChip(
                  child: Text(
                    subtask.priority!.name.capitalize(),
                    style: context.text.bodyMedium,
                  ),
                ),
                const SizedBox(height: 10),
                Text(FormatHelper.formatDate(subtask.date!)),
                const SizedBox(height: 10),
                Text(subtask.description),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              CupertinoButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                child: SvgIcon(
                  subtask.done
                      ? Assets.icons.checkmark
                      : Assets.icons.checkmarkEmpty,
                  color: context.colors.onSurface,
                ),
                onPressed: () async {
                  await context.read<EventCubit>().updateSubtask(
                        event: event,
                        subtask: subtask.copyWith(done: !subtask.done),
                      );
                },
              ),
              EditOrDeleteButton(
                onUpdateRequested: () => context.router.push(
                  AddSubtaskRoute(
                    event: event,
                    subtask: subtask,
                  ),
                ),
                onDeleteConfirmed: () async =>
                    await context.read<EventCubit>().deleteSubtask(
                          event: event,
                          subtask: subtask,
                        ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
