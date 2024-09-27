import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/new_event/budget/expense_form_entry.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class AddExpenseScreen extends StatefulWidget {
  final Event event;
  final Expense? expense;
  const AddExpenseScreen({super.key, required this.event, this.expense});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  Expense _expense = Expense(
    uuid: const UuidV4().generate(),
    name: '',
    amount: null,
  );

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _expense = widget.expense!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20 + 24 + 20,
        leading: const CustomBackButton(),
        title: Text(
          'Add expense',
          style: context.text.bodyMedium,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: context.colors.surface,
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
                  child: ExpenseFormEntry(
                    expense: _expense,
                    expenseList: const [],
                    onUpdated: (newExpense) => setState(
                      () => _expense = newExpense,
                    ),
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
                        if (widget.expense == null) {
                          await cubit.addExpense(
                            event: widget.event,
                            expense: _expense,
                          );
                        } else {
                          await cubit.updateExpense(
                            event: widget.event,
                            expense: _expense,
                          );
                        }
                        router.popForced();
                      },
                      active:
                          _expense.name.isNotEmpty && _expense.amount != null,
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
