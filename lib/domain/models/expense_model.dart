import 'package:expense_tracker_app/utils/constant.dart';

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); // générer identifiant unique et l'attribué comme valeur à la proprieté id

  final String
      id; // crée cet identifiant unique de manière dynamique à chaque fois qu'un nouvel objet Expense est créé
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

// définir un ensemble de valeurs constantes qui représentent un type spécifique.
/// utilisées dans des conditions, des boucles ou des structures de données
enum Category { food, travel, leisure, work }
