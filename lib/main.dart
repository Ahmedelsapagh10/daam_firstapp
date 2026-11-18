import 'package:first_project/login_screen.dart';
import 'package:first_project/products.dart';
import 'package:flutter/material.dart';

import 'image_view.dart';
import 'splashscreen.dart';

//! New Branch for session two [flutter]
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/product': (context) => ProductsScreen(),

        '/image': (context) => ImageView(),
        '/login': (context) => LoginScreen(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
