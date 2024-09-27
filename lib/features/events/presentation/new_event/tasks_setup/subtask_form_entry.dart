import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/string_extension.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/ui_kit/custom_date_picker.dart';
import 'package:pp_467/core/ui_kit/custom_text_field.dart';
import 'package:pp_467/core/ui_kit/titled_section.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/domain/entities/subtask_priority/subtask_priority.dart';
import 'package:pp_467/core/ui_kit/fake_textfield.dart';

class SubtaskFormEntry extends StatefulWidget {
  final Subtask subtask;
  final List<Subtask> subtaskList;
  final Function(Subtask newSubtask) onUpdated;
  final VoidCallback onDeleted;
  const SubtaskFormEntry({
    super.key,
    required this.subtask,
    required this.subtaskList,
    required this.onUpdated,
    required this.onDeleted,
  });

  @override
  State<SubtaskFormEntry> createState() => _SubtaskFormEntryState();
}

class _SubtaskFormEntryState extends State<SubtaskFormEntry> {
  late TextEditingController _titleController;
  DateTime? _date;
  late TextEditingController _descriptionController;
  SubtaskPriority? _priority;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _initFields();
  }

  @override
  void didUpdateWidget(covariant SubtaskFormEntry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.subtask != oldWidget.subtask) {
      _initFields();
    }
  }

  void _initFields() {
    final subtask = widget.subtask;
    _titleController.text = subtask.title;
    _date = subtask.date;
    _descriptionController.text = subtask.description;
    _priority = subtask.priority;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtask title',
              style: context.text.displaySmall,
            ),
            if (widget.subtaskList.length > 1)
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: widget.onDeleted,
                child: Text(
                  'Remove',
                  style: context.text.bodyMedium!.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        CustomTextField(
          placeholder: 'Subtask title',
          controller: _titleController,
          onChanged: (_) => setState(
            () {
              widget.onUpdated(
                widget.subtask.copyWith(
                  title: _titleController.text,
                ),
              );
            },
          ),
          multiline: false,
        ),
        const SizedBox(height: 20),
        TitledSection(
          title: 'Date',
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CustomDatePicker(
                date: _date,
                onSaved: (newDate) => setState(
                  () {
                    _date = newDate;
                    widget.onUpdated(
                      widget.subtask.copyWith(
                        date: _date,
                      ),
                    );
                  },
                ),
                mode: CupertinoDatePickerMode.date,
              ),
            ),
            child: FakeTextfield(
              text: _date == null
                  ? '00.00.0000'
                  : FormatHelper.formatDate(_date!),
              inactive: _date == null,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TitledSection(
          title: 'Description',
          child: CustomTextField(
            placeholder: 'Description',
            controller: _descriptionController,
            onChanged: (_) => setState(
              () {
                widget.onUpdated(
                  widget.subtask.copyWith(
                    description: _descriptionController.text,
                  ),
                );
              },
            ),
            multiline: true,
          ),
        ),
        const SizedBox(height: 20),
        TitledSection(
          title: 'Priority',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: SubtaskPriority.values
                    .map(
                      (e) => CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => setState(
                          () {
                            _priority = e;
                            widget.onUpdated(
                              widget.subtask.copyWith(
                                priority: _priority,
                              ),
                            );
                          },
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                _priority == e ? context.colors.primary : null,
                            border: Border.all(
                              color: context.colors.onSurface,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            e.name.capitalize(),
                            style: context.text.bodyMedium!.copyWith(
                              color: _priority == e
                                  ? context.colors.onPrimary
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
