import 'package:first_project/features/home_screen/cubit/cubit.dart';
import 'package:first_project/features/home_screen/data/repository/home_rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'features/home_screen/data/web_services/home_web_services.dart';
import 'features/splash/splash_screen.dart';

//! api
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRep(HomeWebServices())),
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
