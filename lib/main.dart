import 'package:expense_tracker_app/app/expense.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // recommander pour la configuration du theme
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
      ),
      home: const Expenses(),
    ),
  );
}
