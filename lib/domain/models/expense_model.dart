import 'package:expense_tracker_app/utils/constant.dart';
import 'package:flutter/material.dart';

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    // uuid.v4() -> générer identifiant unique et l'attribué comme valeur à la proprieté id
  }) : id = uuid.v4();

  // id -> crée cet identifiant unique de manière dynamique à chaque fois qu'un nouvel objet Expense est créé
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

// définir un ensemble de valeurs constantes qui représentent un type spécifique.
/// utilisées dans des conditions, des boucles ou des structures de données
enum Category { food, travel, leisure, work }

const Map<Category, IconData> categoryIcons = {
  Category.food: Icons.launch_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
