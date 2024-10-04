import 'package:flutter/material.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';

class BudgetInheritedWidget extends InheritedWidget {
  final List<Expense> expenses;

  const BudgetInheritedWidget({
    super.key,
    required super.child,
    required this.expenses,
  });

  static BudgetInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BudgetInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
