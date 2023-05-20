import 'package:expense_tracker_app/app/expense.dart';
import 'package:expense_tracker_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kTheme,
      darkTheme: kDarkTheme,
      // themeMode: ThemeMode.system, // default
      home: const Expenses(),
    ),
  );
}
