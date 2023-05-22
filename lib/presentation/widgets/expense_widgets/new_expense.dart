import 'package:expense_tracker_app/domain/models/expense_model.dart';
import 'package:expense_tracker_app/utils/constant.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    // Show DatePicker dialog
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    /// await -> indique à flutter que cette valeur qui sera stocker dans 'pickerDate' ne sera pas dispo immédiatement
    final pickerDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,

      /// cette fn sera executer par flutter quand cette valeur sera dispo
    );
    setState(() {
      _selectedDate = pickerDate;
    });
  }

  void _submitExpenseData() {
    // tryParse() -> convertir un text en nombre
    // tryParse(hello) => null // tryParse(1.22) => 1.22
    var enteredAmount = double.tryParse(_amountController.text);

    // si une condition entre les deux est vrai, le montant sera invalid
    var amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    // trim() -> supprime les espaces au debut et à la fin du mots
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      /// print('Veuillez bien remplir les valeurs exact !');
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure a valid title, amount, date and category was entered.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    // if all the conditions are ok, submit the expense data
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   // j'ai pas mis setState parce que j'enregistre seulement la valeur saisi dans une variable
  //   // setState est utiliser pour maitre ajour le UI
  //   _enteredTitle = inputValue; // save data
  // }

  @override
  Widget build(BuildContext context) {
    // viewInsets => UI superposition
    // obtenir la quantité d'espace occupé par le clavier
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    List<DropdownMenuItem> items = Category.values
        .map(
          (cat) => DropdownMenuItem(
            value: cat,
            child: Text(cat.name.toUpperCase()),
          ),
        )
        .toList();

    return LayoutBuilder(builder: (ctx, contraints) {
      // // contraints => nous indique quelles contraintes sont appliquées par le widgets parents
      // print(contraints);
      // // voir l'espace que nous disposons
      // // afin de construire nos widgets anywhere dans le scaffold
      // // sans avoir à se soucier de la hauteur et la largeur
      // print('minWidth : ${contraints.minWidth}');
      // print('maxWidth : ${contraints.maxWidth}');
      // print('minHeight : ${contraints.minHeight}');
      // print('maxHeight : ${contraints.maxHeight}');

      // largeur maximale we can used
      final width = contraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          // onChanged -> stocker ou enregisterer la donnée saisi par l'utilisateur
                          // onChanged: _saveTitleInput,
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    // onChanged -> stocker ou enregisterer la donnée saisi par l'utilisateur
                    // onChanged: _saveTitleInput,
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: items,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          // ce setState execute ssi la valeur est pas nulle
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'No date selected'
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'No date selected'
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 16),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        // onPressed: () {
                        //   // print(_enteredTitle);
                        //   // print(_titleController.text);
                        //   // print(_amountController.text);
                        // },
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: items,
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          // ce setState execute ssi la valeur est pas nulle
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        // onPressed: () {
                        //   // print(_enteredTitle);
                        //   // print(_titleController.text);
                        //   // print(_amountController.text);
                        // },
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
