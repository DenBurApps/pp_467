import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/custom_date_picker.dart';
import 'package:pp_467/core/ui_kit/custom_text_field.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/titled_section.dart';
import 'package:pp_467/core/ui_kit/fake_textfield.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/main_info/main_info_inh_widget.dart';

class MainInfoContent extends StatefulWidget {
  final String submitButtonTitle;
  final VoidCallback submitButtonCallback;
  const MainInfoContent({
    super.key,
    required this.submitButtonTitle,
    required this.submitButtonCallback,
  });

  @override
  State<MainInfoContent> createState() => _MainInfoContentState();
}

class _MainInfoContentState extends State<MainInfoContent> {
  @override
  Widget build(BuildContext context) {
    final inherited = MainInfoInheritedWidget.of(context);
    if (inherited == null) return const SizedBox.shrink();
    return Section(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                TitledSection(
                  title: 'Title of the event',
                  child: CustomTextField(
                    placeholder: 'Title',
                    controller: inherited.titleController,
                    onChanged: (_) => setState(() {}),
                    multiline: false,
                  ),
                ),
                const SizedBox(height: 20),
                TitledSection(
                  title: 'Date and time',
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CustomDatePicker(
                        date: inherited.dateTime,
                        onSaved: inherited.onDateTimeChanged,
                        mode: CupertinoDatePickerMode.dateAndTime,
                      ),
                    ),
                    child: FakeTextfield(
                      text: inherited.dateTime == null
                          ? '00.00.0000 00:00'
                          : FormatHelper.formatDateAndTime(inherited.dateTime!),
                      inactive: inherited.dateTime == null,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TitledSection(
                  title: 'Location',
                  child: CustomTextField(
                    placeholder: 'Location',
                    controller: inherited.locationController,
                    onChanged: (_) => setState(() {}),
                    multiline: false,
                  ),
                ),
                const SizedBox(height: 20),
                TitledSection(
                  title: 'Description',
                  child: CustomTextField(
                    placeholder: 'Description',
                    controller: inherited.descriptionController,
                    onChanged: (_) => setState(() {}),
                    multiline: true,
                  ),
                ),
                const SizedBox(height: 30),
              ],
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
                  onPressed: () {
                    widget.submitButtonCallback();
                  },
                  active: inherited.titleController.text.isNotEmpty &&
                      inherited.dateTime != null &&
                      inherited.locationController.text.isNotEmpty,
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
