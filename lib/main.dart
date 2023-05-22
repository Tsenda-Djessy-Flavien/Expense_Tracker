import 'package:expense_tracker_app/app/expense.dart';
import 'package:expense_tracker_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // // s'assurer que le verrouillage de l'orientation de l'écran et l'execution de l'app functionne comme prévu
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp], // définir l'orientation de l'app
  // ).then((fn) {
  //   // appliquer l'orientation de l'app avant l'execution
  //   runApp(
  //     MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       theme: kTheme,
  //       darkTheme: kDarkTheme,
  //       // themeMode: ThemeMode.system, // default
  //       home: const Expenses(),
  //     ),
  //   );
  // });

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
