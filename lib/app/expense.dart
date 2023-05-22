import 'package:expense_tracker_app/domain/models/expense_model.dart';
import 'package:expense_tracker_app/presentation/widgets/chart/chart.dart';
import 'package:expense_tracker_app/presentation/widgets/expense_widgets/expense_list.dart';
import 'package:expense_tracker_app/presentation/widgets/expense_widgets/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _resgisteredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    // indexOf => obtenir la position d'une valeur dans une list
    final expendeIndex = _resgisteredExpenses.indexOf(expense);

    setState(() {
      _resgisteredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // insert => ajout un elt à une list tout en specifiant sa position
              _resgisteredExpenses.insert(expendeIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // deternimer la largeur disponible
    final width = MediaQuery.of(context).size.width; // larguer de mon écran

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some !'),
    );

    if (_resgisteredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _resgisteredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _resgisteredExpenses),
                Expanded(
                  // check si les expense existe ou pas
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _resgisteredExpenses)),
                Expanded(
                  // check si les expense existe ou pas
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
