import 'package:expense_tracker_app/utils/constant.dart';

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid
            .v4(); // générer identifiant unique et l'attribué comme valeur à la proprieté id

  final String
      id; // crée cet identifiant unique de manière dynamique à chaque fois qu'un nouvel objet Expense est créé
  final String title;
  final double amount;
  final DateTime date;
}
