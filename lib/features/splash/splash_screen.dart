import 'dart:developer';

import 'package:first_project/core/localstorage/local_storage.dart';
import 'package:first_project/features/main_screen/presentation/main_screen.dart';
import 'package:flutter/material.dart';

import '../login_screen/presentation/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () async {
      final token = await LocalStorage().getToken();

      log('TOKEN : $token');
      //! token local storage > main : login
      if (token != null && token != '') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Hero(
          tag: 'xyz',
          curve: Curves.easeInOut,
          child: Text(
            'NEWS APP',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
