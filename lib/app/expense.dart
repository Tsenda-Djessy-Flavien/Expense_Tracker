import 'package:expense_tracker_app/domain/models/expense_model.dart';
import 'package:expense_tracker_app/presentation/widgets/expense_widgets/expense_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _resgisteredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.97,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpenseList(expenses: _resgisteredExpenses)),
        ],
      ),
    );
  }
}
