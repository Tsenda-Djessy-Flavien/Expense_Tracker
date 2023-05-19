import 'package:expense_tracker_app/app/expense.dart';
import 'package:expense_tracker_app/utils/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // recommander pour la configuration du theme
      theme: ThemeData().copyWith(
        useMaterial3: true,
        // recommander pour la configuration des colors
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          // recommander pour la configuration de la barre d'action
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onPrimary,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
