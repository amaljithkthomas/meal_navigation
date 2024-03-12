import 'package:flutter/material.dart';
import 'package:navigation/constants/constants.dart';
import 'package:navigation/screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Constants.theme,
      home: const TabScreen(),
    );
  }
}
