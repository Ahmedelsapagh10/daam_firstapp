import 'package:first_project/features/home_screen/cubit/cubit.dart';
import 'package:first_project/features/home_screen/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().loadScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is IncreamentHomeState) {
          toastification.show(
            context: context,
            primaryColor: Colors.blue,
            title: Text('Current value ${context.read<HomeCubit>().counter}'),
            autoCloseDuration: const Duration(seconds: 1),
          );
        }
        if (state is DecreamentHomeState) {
          toastification.show(
            context: context,
            primaryColor: Colors.red,

            title: Text('Current value ${context.read<HomeCubit>().counter}'),
            autoCloseDuration: const Duration(seconds: 1),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state is LoadingScreen
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.watch<HomeCubit>().counter.toString(),
                        textScaleFactor: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              context.read<HomeCubit>().increament();
                            },
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<HomeCubit>().decreament();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Icon(
                              Icons.minimize_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
