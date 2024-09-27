import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/ui_kit/edit_or_delete_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/gen/assets.gen.dart';

class GuestCard extends StatelessWidget {
  final Event event;
  final Guest guest;
  const GuestCard({
    super.key,
    required this.event,
    required this.guest,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgIcon(Assets.icons.user),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        guest.name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgIcon(Assets.icons.contactBook),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        guest.contacts,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          EditOrDeleteButton(
            onUpdateRequested: () => context.router.push(
              AddGuestRoute(
                event: event,
                guest: guest,
              ),
            ),
            onDeleteConfirmed: () async {
              await context.read<EventCubit>().deleteGuest(
                    event: event,
                    guest: guest,
                  );
            },
          ),
        ],
      ),
    );
  }
}
