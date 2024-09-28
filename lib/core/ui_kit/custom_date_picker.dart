import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? date;
  final Function(DateTime) onSaved;
  final CupertinoDatePickerMode mode;
  const CustomDatePicker({
    super.key,
    required this.date,
    required this.onSaved,
    required this.mode,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = widget.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton.title(
              color: context.colors.primary,
              title: 'Apply',
              onPressed: () {
                widget.onSaved(date);
                context.router.popForced();
              },
              active: true,
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              use24hFormat: true,
              mode: widget.mode,
              initialDateTime: date,
              onDateTimeChanged: (val) => setState(() => date = val),
            ),
          ),
        ],
      ),
    );
  }
}
