import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/event_card.dart';
import 'package:pp_467/gen/assets.gen.dart';

@RoutePage()
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceBright,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const CustomBackButton(),
        title: Text(
          'Calendar',
          style: context.text.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colors.surfaceDim,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 75,
                pinned: true,
                backgroundColor: context.colors.surfaceDim,
                flexibleSpace: FlexibleSpaceBar(
                  background: Section(
                    child: Column(
                      children: [
                        Text(
                          _date.year.toString(),
                          style: context.text.bodyLarge,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Row(
                                  children: [
                                    SvgIcon(
                                      Assets.icons.backward,
                                      side: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      DateFormat('MMM')
                                          .format(_date.copyWith(
                                              month: _date.month - 1))
                                          .toUpperCase(),
                                      style: context.text.bodyLarge.copyWith(
                                        color: context.colors.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () => setState(
                                  () => _date =
                                      _date.copyWith(month: _date.month - 1),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.surfaceBright,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: AnimatedSize(
                                duration: Durations.medium1,
                                child: Text(
                                  DateFormat('MMMM')
                                      .format(_date)
                                      .toUpperCase(),
                                  style: context.text.bodyLarge,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('MMM')
                                          .format(_date.copyWith(
                                              month: _date.month + 1))
                                          .toUpperCase(),
                                      style: context.text.bodyLarge.copyWith(
                                        color: context.colors.onSurface,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SvgIcon(
                                      Assets.icons.forward,
                                      side: 20,
                                    ),
                                  ],
                                ),
                                onPressed: () => setState(
                                  () => _date =
                                      _date.copyWith(month: _date.month + 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 15, bottom: 56),
                sliver: BlocBuilder<EventCubit, List<Event>>(
                  builder: (context, state) {
                    final events = state
                        .where((e) =>
                            e.dateTime.month == _date.month &&
                            e.dateTime.year == _date.year)
                        .toList();
                    if (events.isEmpty) {
                      return SliverPadding(
                        padding: const EdgeInsets.only(top: 30),
                        sliver: SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.images.common.placeholder.path,
                                width: 220,
                                height: 220,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'There are no events today',
                                style: context.text.displaySmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return SliverList.separated(
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return EventCard(
                          event: event,
                          bottomRight: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                event.dateTime.day.toString(),
                                style: context.text.displayMedium.copyWith(
                                  color: context.colors.onPrimary,
                                ),
                              ),
                              Text(
                                DateFormat('MMM').format(event.dateTime),
                                style: context.text.bodyMedium.copyWith(
                                  color: context.colors.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 7),
                      itemCount: events.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
