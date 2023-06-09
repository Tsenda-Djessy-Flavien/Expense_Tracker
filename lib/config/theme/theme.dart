import 'package:expense_tracker_app/utils/constant.dart';
import 'package:flutter/material.dart';

// recommander pour la configuration du theme
var kTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
  appBarTheme: kAppBarTheme,
  cardTheme: kCardTheme,
  elevatedButtonTheme: kElevatedButtonTheme,
  textTheme: kTextTheme,
);

var kDarkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
  // appBarTheme: kDarkAppBarTheme,
  cardTheme: kDarkCardTheme,
  elevatedButtonTheme: kDarkElevatedButtonTheme,
);

// colorScheme // fromSeed : recommander
var kColorScheme = ColorScheme.fromSeed(seedColor: kColor);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: kDarkColor,
);

// recommander pour la configuration de la barre d'action
var kAppBarTheme = const AppBarTheme().copyWith(
  backgroundColor: kColorScheme.onPrimaryContainer,
  foregroundColor: kColorScheme.primaryContainer,
);

var kDarkAppBarTheme = const AppBarTheme().copyWith(
  backgroundColor: kDarkColorScheme.onPrimaryContainer,
  foregroundColor: kDarkColorScheme.primaryContainer,
);

// recommander pour la configuration des Cards
var kCardTheme = const CardTheme().copyWith(
  color: kColorScheme.secondaryContainer,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
);

var kDarkCardTheme = const CardTheme().copyWith(
  color: kDarkColorScheme.secondaryContainer,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
);

// recommander pour la configuration des ElevatedButton
var kElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: kColorScheme.primaryContainer,
  ),
);

var kDarkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: kDarkColorScheme.primaryContainer,
    foregroundColor: kDarkColorScheme.onPrimaryContainer,
  ),
);

// recommander pour la configuration des Text
var kTextTheme = ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorScheme.onSecondaryContainer,
        fontSize: 16,
      ),
    );
