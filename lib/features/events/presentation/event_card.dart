import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/services/image_service.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/presentation/black_chip.dart';
import 'package:pp_467/features/events/presentation/open_event/screens/circular_progress_painter.dart';
import 'package:pp_467/gen/assets.gen.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.bottomRight,
  });

  final Event event;
  final Widget bottomRight;

  @override
  Widget build(BuildContext context) {
    final int total = event.subtasks.length;
    final int completed = event.subtasks.where((e) => e.done).length;
    final double progress = total == 0 ? 0 : completed / total;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 6),
      height: 203,
      child: Hero(
        tag: event.uuid,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.router.push(OpenEventRoute(event: event)),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 14, bottom: 13),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      context.read<ImageService>().loadImage(event.imagePath),
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Stack(
                          children: [
                            ClipOval(
                              child: SizedBox(
                                width: 70,
                                height: 70,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.4),
                                    padding: const EdgeInsets.all(10),
                                    child: FittedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${(progress * 100).round()}%',
                                            style:
                                                context.text.bodyLarge.copyWith(
                                              color: context.colors.onPrimary,
                                            ),
                                          ),
                                          Text(
                                            'done',
                                            style: context.text.bodyMedium
                                                .copyWith(
                                              color: context.colors.onPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircularProgressIndicatorWidget(
                              progress: progress,
                              borderWidth: 5,
                              size: 70,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlackChip(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              event.title,
                              style: context.text.bodyMedium.copyWith(
                                color: context.colors.onSurface,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgIcon(
                                      Assets.icons.location,
                                      color: context.colors.onPrimary,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      event.location,
                                      style: context.text.bodyMedium.copyWith(
                                        color: context.colors.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: bottomRight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
