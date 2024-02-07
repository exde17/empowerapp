import 'package:empower_app/src/screens/counter/counter_screen.dart';
import 'package:empower_app/src/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(colorSchemeSeed: const Color.fromARGB(255, 29, 8, 188)),
        home: const Login());
  }
}
