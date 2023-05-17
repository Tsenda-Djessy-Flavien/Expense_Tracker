import 'package:expense_tracker_app/domain/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // Column() : utiliser pour les lists dont on connait la longueur.
    // ListView :  utiliser pour les lists dont on ne conait pas la longueur.
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
