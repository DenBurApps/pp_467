import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_text_field.dart';
import 'package:pp_467/core/ui_kit/titled_section.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';

class GuestFormEntry extends StatefulWidget {
  final Guest guest;
  final List<Guest> guestList;
  final Function(Guest newGuest) onUpdated;
  final VoidCallback onDeleted;
  const GuestFormEntry({
    super.key,
    required this.guest,
    required this.guestList,
    required this.onUpdated,
    required this.onDeleted,
  });

  @override
  State<GuestFormEntry> createState() => _GuestFormEntryState();
}

class _GuestFormEntryState extends State<GuestFormEntry> {
  late TextEditingController _nameController;
  late TextEditingController _contactsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _contactsController = TextEditingController();
    _initFields();
  }

  @override
  void didUpdateWidget(covariant GuestFormEntry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.guest != oldWidget.guest) {
      _initFields();
    }
  }

  void _initFields() {
    final guest = widget.guest;
    _nameController.text = guest.name;
    _contactsController.text = guest.contacts;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Guest name',
                  style: context.text.displaySmall,
                ),
                if (widget.guestList.length > 1)
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: widget.onDeleted,
                    child: Text(
                      'Remove',
                      style: context.text.bodyMedium.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              placeholder: 'Guest name',
              controller: _nameController,
              onChanged: (_) => setState(
                () {
                  widget.onUpdated(
                    widget.guest.copyWith(
                      name: _nameController.text,
                    ),
                  );
                },
              ),
              multiline: false,
            ),
          ],
        ),
        const SizedBox(height: 20),
        TitledSection(
          title: 'Guest contacts',
          child: CustomTextField(
            placeholder: 'Guest contacts',
            controller: _contactsController,
            onChanged: (_) => setState(
              () {
                widget.onUpdated(
                  widget.guest.copyWith(
                    contacts: _contactsController.text,
                  ),
                );
              },
            ),
            multiline: false,
          ),
        ),
      ],
    );
  }
}
