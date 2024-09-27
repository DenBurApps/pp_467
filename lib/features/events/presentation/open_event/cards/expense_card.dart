import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/edit_or_delete_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';

class ExpenseCard extends StatelessWidget {
  final Event event;
  final Expense expense;
  const ExpenseCard({
    super.key,
    required this.event,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.name,
                  style: context.text.displaySmall,
                ),
                const SizedBox(height: 8),
                Text('\$${expense.amount}'),
              ],
            ),
          ),
          const SizedBox(width: 8),
          EditOrDeleteButton(
            onUpdateRequested: () => context.router.push(
              AddExpenseRoute(
                event: event,
                expense: expense,
              ),
            ),
            onDeleteConfirmed: () async {
              await context.read<EventCubit>().deleteExpense(
                    event: event,
                    expense: expense,
                  );
            },
          ),
        ],
      ),
    );
  }
}
