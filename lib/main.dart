import 'package:first_project/products.dart';
import 'package:flutter/material.dart';

//! New Branch for session two [flutter]
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
