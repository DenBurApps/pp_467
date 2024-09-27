import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';

class CustomTimePicker extends StatefulWidget {
  final DateTime? initialTime;
  final Function(DateTime time) onTimeSelected;
  const CustomTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late DateTime _time = widget.initialTime ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Section(
          child: Container(
            decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 250,
            child: CupertinoDatePicker(
              selectionOverlayBuilder: (context,
                  {required columnCount, required selectedIndex}) {
                if (selectedIndex == 0) {
                  return CupertinoPickerDefaultSelectionOverlay(
                    background: context.colors.primary.withOpacity(0.3),
                    capEndEdge: false,
                  );
                } else if (selectedIndex == columnCount - 1) {
                  return CupertinoPickerDefaultSelectionOverlay(
                    background: context.colors.primary.withOpacity(0.3),
                    capStartEdge: false,
                  );
                }
                return CupertinoPickerDefaultSelectionOverlay(
                  background: context.colors.primary.withOpacity(0.3),
                  capStartEdge: false,
                  capEndEdge: false,
                );
              },
              mode: CupertinoDatePickerMode.time,
              use24hFormat: true,
              initialDateTime: _time,
              onDateTimeChanged: (value) => setState(() => _time = value),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Section(
          child: Section(
            child: CustomButton.title(
              title: 'Apply ${FormatHelper.formatTime(_time)}',
              onPressed: () {
                widget.onTimeSelected(_time);
                context.router.popForced();
              },
              active: true,
            ),
          ),
        ),
      ],
    );
  }
}
