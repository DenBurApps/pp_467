import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/presentation/new_event/budget/budget_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/budget/expense_form_entry.dart';
import 'package:pp_467/gen/assets.gen.dart';
import 'package:uuid/v4.dart';

class BudgetContent extends StatefulWidget {
  final String submitButtonTitle;
  final VoidCallback submitButtonCallback;
  const BudgetContent({
    super.key,
    required this.submitButtonTitle,
    required this.submitButtonCallback,
  });

  @override
  State<BudgetContent> createState() => _BudgetContentState();
}

class _BudgetContentState extends State<BudgetContent> {
  @override
  Widget build(BuildContext context) {
    final inherited = BudgetInheritedWidget.of(context);
    if (inherited == null) return const SizedBox.shrink();
    return Section(
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: inherited.expenses.length,
            itemBuilder: (context, index) {
              final expense = inherited.expenses[index];
              return ExpenseFormEntry(
                key: ValueKey(index),
                expense: expense,
                expenseList: inherited.expenses,
                onUpdated: (newExpenses) => setState(
                  () => inherited.expenses[index] = newExpenses,
                ),
                onDeleted: () => setState(
                  () => inherited.expenses.remove(expense),
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
                  () => inherited.expenses.add(
                    Expense(
                      uuid: const UuidV4().generate(),
                      name: '',
                      amount: null,
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
                  active: inherited.expenses
                      .where((e) => e.name.isEmpty || e.amount == null)
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
