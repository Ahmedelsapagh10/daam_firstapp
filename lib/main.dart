import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/screens/products.dart';
import 'package:flutter/material.dart';

import 'screens/image_view.dart';
import 'screens/splashscreen.dart';

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
