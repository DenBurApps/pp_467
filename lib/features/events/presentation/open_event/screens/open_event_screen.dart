import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/string_extension.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/services/image_service.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/core/ui_kit/white_bordered_chip.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/open_event/cards/expense_card.dart';
import 'package:pp_467/features/events/presentation/open_event/cards/guest_card.dart';
import 'package:pp_467/features/events/presentation/open_event/segment/open_event_segment.dart';
import 'package:pp_467/features/events/presentation/open_event/cards/subtask_card.dart';
import 'package:pp_467/features/settings/dialogs/dialog_manager.dart';
import 'package:pp_467/gen/assets.gen.dart';
import 'package:pull_down_button/pull_down_button.dart';

@RoutePage()
class OpenEventScreen extends StatefulWidget {
  final Event event;
  const OpenEventScreen({super.key, required this.event});

  @override
  State<OpenEventScreen> createState() => _OpenEventScreenState();
}

class _OpenEventScreenState extends State<OpenEventScreen> {
  OpenEventSegment _selectedSegment = OpenEventSegment.subtasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20 + 24 + 20,
        leading: const CustomBackButton(),
        title: Text(
          'Event',
          style: context.text.bodyMedium,
        ),
        actions: [
          PullDownButton(
            itemBuilder: (context) => [
              PullDownMenuItem(
                title: 'Edit',
                iconWidget: SvgIcon(Assets.icons.edit),
                onTap: () {},
                // onTap: () => context.router.push(
                //   NewEventRoute(event: widget.event),
                // ),
              ),
              PullDownMenuItem(
                isDestructive: true,
                title: 'Delete',
                iconWidget: SvgIcon(Assets.icons.trash),
                onTap: () async {
                  final cubit = context.read<EventCubit>();
                  final router = context.router;
                  final result =
                      await DialogManager.deleteConfirmationDialog(context);
                  if (result != null && result) {
                    await cubit.delete(event: widget.event);
                    router.popForced();
                  }
                },
              ),
            ],
            buttonBuilder: (context, showMenu) => CupertinoButton(
              padding: const EdgeInsets.only(right: 16),
              onPressed: showMenu,
              child: SvgIcon(
                Assets.icons.edit,
                color: context.colors.onSurface,
                side: 36,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: BlocBuilder<EventCubit, List<Event>>(builder: (context, state) {
          final event =
              state.firstWhereOrNull((e) => e.uuid == widget.event.uuid);
          if (event == null) {
            return const CupertinoActivityIndicator();
          }
          final int totalSubtasks = event.subtasks.length;
          final int completedSubtasks =
              event.subtasks.where((e) => e.done).length;
          final double progressPercentage =
              totalSubtasks == 0 ? 0 : completedSubtasks / totalSubtasks;
          final double sweepAngle = progressPercentage * 2 * pi;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                stretch: true,
                expandedHeight: 190,
                collapsedHeight: 0,
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: Hero(
                  tag: 'event ${event.uuid}',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.file(
                      context.read<ImageService>().loadImage(event.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Section(
                  child: AnimatedSize(
                    alignment: Alignment.topCenter,
                    curve: Curves.easeOut,
                    duration: Durations.medium1,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              FittedBox(
                                child: WhiteBorderedChip(
                                  child: Row(
                                    children: [
                                      SvgIcon(
                                        Assets.icons.calendar,
                                        color: context.colors.onSurface,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        FormatHelper.formatDateShort(
                                          event.dateTime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: WhiteBorderedChip(
                                  child: Row(
                                    children: [
                                      SvgIcon(
                                        Assets.icons.clock,
                                        color: context.colors.onSurface,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        TimeOfDay.fromDateTime(event.dateTime)
                                            .format(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              WhiteBorderedChip(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgIcon(
                                      Assets.icons.location,
                                      color: context.colors.onSurface,
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Text(event.location),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                event.title,
                                style: context.text.bodyLarge,
                              ),
                            ),
                            const SizedBox(width: 10),
                            switch (_selectedSegment) {
                              OpenEventSegment.subtasks => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomPaint(
                                    // painter: PartialCircleBorderPainter(
                                    //   borderColor: context.colors.primary,
                                    //   borderWidth: 3,
                                    //   startAngle: -pi / 2,
                                    //   sweepAngle: sweepAngle,
                                    // ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${(progressPercentage * 100).round()}%',
                                          style: context.text.bodyMedium,
                                        ),
                                        Text(
                                          'done',
                                          style: context.text.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              OpenEventSegment.guests => Column(
                                  children: [
                                    Text(
                                      'Guests',
                                      style: context.text.bodyMedium,
                                    ),
                                    Text(
                                      event.guests.length.toString(),
                                      style: context.text.bodySmall,
                                    ),
                                  ],
                                ),
                              OpenEventSegment.budget => Column(
                                  children: [
                                    Text(
                                      'Total',
                                      style: context.text.bodyMedium,
                                    ),
                                    Text(
                                      '\$${event.expenses.fold(0.0, (prev, elem) => prev += elem.amount!).round()}',
                                      style: context.text.bodySmall,
                                    ),
                                  ],
                                ),
                            }
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomSlidingSegmentedControl(
                          isStretch: true,
                          initialValue: _selectedSegment,
                          children: {
                            for (final e in OpenEventSegment.values)
                              e: AnimatedDefaultTextStyle(
                                style: context.text.bodyMedium!.copyWith(
                                  color: _selectedSegment == e
                                      ? context.colors.surface
                                      : context.colors.onSurface,
                                ),
                                duration: const Duration(milliseconds: 100),
                                child: Text(
                                  e.name.capitalize(),
                                ),
                              ),
                          },
                          decoration: BoxDecoration(
                            color: context.colors.surfaceContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          thumbDecoration: BoxDecoration(
                            color: context.colors.primary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 4.0,
                                spreadRadius: 1.0,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                              ),
                            ],
                          ),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubicEmphasized,
                          onValueChanged: (v) =>
                              setState(() => _selectedSegment = v),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList.separated(
                itemCount: switch (_selectedSegment) {
                  OpenEventSegment.subtasks => event.subtasks.length,
                  OpenEventSegment.guests => event.guests.length,
                  OpenEventSegment.budget => event.expenses.length,
                },
                itemBuilder: (context, index) {
                  switch (_selectedSegment) {
                    case OpenEventSegment.subtasks:
                      final subtask = event.subtasks.reversed.toList()[index];
                      return SubtaskCard(event: event, subtask: subtask);
                    case OpenEventSegment.guests:
                      final guest = event.guests.reversed.toList()[index];
                      return GuestCard(event: event, guest: guest);
                    case OpenEventSegment.budget:
                      final expense = event.expenses.reversed.toList()[index];
                      return ExpenseCard(event: event, expense: expense);
                  }
                },
                separatorBuilder: (context, index) => Divider(
                  height: 40,
                  color: context.colors.primary,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 56),
                    child: CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: SvgIcon(
                        Assets.icons.addRounded,
                        side: 34,
                      ),
                      onPressed: () => context.router.push(
                        switch (_selectedSegment) {
                          OpenEventSegment.subtasks => AddSubtaskRoute(
                              event: event,
                            ),
                          OpenEventSegment.guests => AddGuestRoute(
                              event: event,
                            ),
                          OpenEventSegment.budget => AddExpenseRoute(
                              event: event,
                            ),
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
