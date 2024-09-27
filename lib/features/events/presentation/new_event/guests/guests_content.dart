import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/presentation/new_event/guests/guest_form_entry.dart';
import 'package:pp_467/features/events/presentation/new_event/guests/guests_inh_widget.dart';
import 'package:pp_467/gen/assets.gen.dart';
import 'package:uuid/v4.dart';

class GuestsContent extends StatefulWidget {
  final String submitButtonTitle;
  final VoidCallback submitButtonCallback;
  const GuestsContent({
    super.key,
    required this.submitButtonTitle,
    required this.submitButtonCallback,
  });

  @override
  State<GuestsContent> createState() => _GuestsContentState();
}

class _GuestsContentState extends State<GuestsContent> {
  @override
  Widget build(BuildContext context) {
    final inherited = GuestsInheritedWidget.of(context);
    if (inherited == null) return const SizedBox.shrink();
    return Section(
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: inherited.guests.length,
            itemBuilder: (context, index) {
              final guest = inherited.guests.reversed.toList()[index];
              return GuestFormEntry(
                guest: guest,
                guestList: inherited.guests,
                onUpdated: (newGuests) => setState(
                  () => inherited.guests[index] = newGuests,
                ),
                onDeleted: () => setState(
                  () => inherited.guests.remove(guest),
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
                  () => inherited.guests.add(
                    Guest(
                      uuid: const UuidV4().generate(),
                      name: '',
                      contacts: '',
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
                  active: inherited.guests
                      .where((e) => e.name.isEmpty || e.contacts.isEmpty)
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
