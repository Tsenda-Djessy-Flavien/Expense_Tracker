import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// générer les identifiants uniques
const uuid = Uuid();

// formater la date
final formatter = DateFormat.yMd();

// colorScheme // fromSeed : recommander
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
