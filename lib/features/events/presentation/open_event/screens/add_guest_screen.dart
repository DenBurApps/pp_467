import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/guests/guest_form_entry.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class AddGuestScreen extends StatefulWidget {
  final Event event;
  final Guest? guest;
  const AddGuestScreen({super.key, required this.event, this.guest});

  @override
  State<AddGuestScreen> createState() => _AddGuestScreenState();
}

class _AddGuestScreenState extends State<AddGuestScreen> {
  Guest _guest = Guest(
    uuid: const UuidV4().generate(),
    name: '',
    contacts: '',
  );

  @override
  void initState() {
    super.initState();
    if (widget.guest != null) {
      _guest = widget.guest!;
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
          'Add guest',
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
                  child: GuestFormEntry(
                    guest: _guest,
                    guestList: const [],
                    onUpdated: (newGuest) => setState(() => _guest = newGuest),
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
                        if (widget.guest == null) {
                          await cubit.addGuest(
                            event: widget.event,
                            guest: _guest,
                          );
                        } else {
                          await cubit.updateGuest(
                            event: widget.event,
                            guest: _guest,
                          );
                        }
                        router.popForced();
                      },
                      active:
                          _guest.name.isNotEmpty && _guest.contacts.isNotEmpty,
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
