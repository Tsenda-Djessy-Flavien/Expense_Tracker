import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          Expanded(
            child: TextField(
              maxLength: 50,
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
