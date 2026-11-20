import 'dart:developer';

import 'package:first_project/local_storage/local_data.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getEmailAndPassword();
    Future.delayed(Duration(seconds: 1), () {
      log('email: $email');
      log('password: $password');
      if (email != null && password != null) {
        Navigator.pushReplacementNamed(
          context,
          '/product',
          arguments: {'email': email, 'password': password},
        );
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    super.initState();
  }

  String? email;
  String? password;
  void getEmailAndPassword() async {
    email = await MyLocalStorage().getEmail();
    password = await MyLocalStorage().getPassword();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Hero(
          tag: 'xyz',
          curve: Curves.easeInOut,
          child: Text(
            'Coffe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
