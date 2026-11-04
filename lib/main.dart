import 'package:first_project/home_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen2.dart';

//! New Branch for session two [flutter]
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
