import 'package:flutter/cupertino.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_text_field.dart';
import 'package:pp_467/core/ui_kit/titled_section.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';

class ExpenseFormEntry extends StatefulWidget {
  final Expense expense;
  final List<Expense> expenseList;
  final Function(Expense newExpense) onUpdated;
  final VoidCallback onDeleted;
  const ExpenseFormEntry({
    super.key,
    required this.expense,
    required this.expenseList,
    required this.onUpdated,
    required this.onDeleted,
  });

  @override
  State<ExpenseFormEntry> createState() => _ExpenseFormEntryState();
}

class _ExpenseFormEntryState extends State<ExpenseFormEntry> {
  late TextEditingController _nameController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _amountController = TextEditingController();
    _initFields();
  }

  @override
  void didUpdateWidget(covariant ExpenseFormEntry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expense != oldWidget.expense) {
      _initFields();
    }
  }

  void _initFields() {
    final expense = widget.expense;
    _nameController.text = expense.name;
    _amountController.text = expense.amount?.toString() ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
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
              'Name of expense',
              style: context.text.displaySmall,
            ),
            if (widget.expenseList.length > 1)
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
          placeholder: 'Name of expense',
          controller: _nameController,
          onChanged: (_) => setState(
            () {
              widget.onUpdated(
                widget.expense.copyWith(
                  name: _nameController.text,
                ),
              );
            },
          ),
          multiline: false,
        ),
        const SizedBox(height: 20),
        TitledSection(
          title: 'Amount',
          child: CustomTextField.numeric(
            placeholder: 'Amount (\$)',
            controller: _amountController,
            onChanged: (_) => setState(
              () {
                widget.onUpdated(
                  widget.expense.copyWith(
                    amount: num.tryParse(_amountController.text),
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
