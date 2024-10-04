import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/datetime_extension.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/ui_kit/app_background.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/common/black_chip.dart';
import 'package:pp_467/features/events/presentation/common/event_card.dart';
import 'package:pp_467/features/events/presentation/common/white_chip.dart';
import 'package:pp_467/gen/assets.gen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: context.colors.primary,
        width: MediaQuery.of(context).size.width * 0.64,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 24),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: context.router.popForced,
                    child: SvgIcon(
                      Assets.icons.close,
                      side: 40,
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
              Align(
                child: CupertinoButton(
                  child: Text(
                    'Articles',
                    style: context.text.displayMedium.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                  onPressed: () => context.router
                    ..popForced()
                    ..push(const ArticlesRoute()),
                ),
              ),
              const SizedBox(width: 30),
              Align(
                child: CupertinoButton(
                  child: Text(
                    'Settings',
                    style: context.text.displayMedium.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                  onPressed: () => context.router
                    ..popForced()
                    ..push(const SettingsRoute()),
                ),
              ),
            ],
          ),
        ),
      ),
      body: AppBackground(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Section(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '${FormatHelper.formatDateWeekday(DateTime.now())},\n${FormatHelper.formatDateCustom(DateTime.now())}',
                              style: context.text.displayLarge,
                            ),
                          ),
                          Builder(
                            builder: (context) => CupertinoButton(
                              minSize: 0,
                              padding: EdgeInsets.zero,
                              onPressed: Scaffold.of(context).openEndDrawer,
                              child: SvgIcon(Assets.icons.menu),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          BlackChip(
                            child: Text(
                              'Today',
                              style: context.text.bodyMedium.copyWith(
                                color: context.colors.onSurface,
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          CupertinoButton(
                            minSize: 0,
                            onPressed: () =>
                                context.router.push(const CalendarRoute()),
                            padding: EdgeInsets.zero,
                            child: WhiteChip(
                              child: Text(
                                'Calendar',
                                style: context.text.bodyMedium.copyWith(
                                  color: context.colors.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your events for today',
                            style: context.text.bodyLarge,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () =>
                                context.router.push(NewEventRoute()),
                            child: SvgIcon(
                              Assets.icons.addRounded,
                              side: 34,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 15, bottom: 56),
                sliver: BlocBuilder<EventCubit, List<Event>>(
                  builder: (context, state) {
                    final events = state
                        .where((e) => e.dateTime.isSameDate(DateTime.now()))
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
                          bottomRight: Align(
                            child: Text(
                              FormatHelper.formatTime(event.dateTime),
                              style: context.text.bodyMedium.copyWith(
                                color: context.colors.onPrimary,
                              ),
                            ),
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
