import 'package:first_project/core/widgets/custom_text_field.dart';
import 'package:first_project/features/login_screen/cubit/cubit.dart';
import 'package:first_project/features/login_screen/cubit/state.dart';
import 'package:first_project/features/login_screen/data/repository/login_repo.dart';
import 'package:first_project/features/login_screen/data/web_services/login_web_services.dart';
import 'package:first_project/features/register_screen/presentation/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main_screen/presentation/main_screen.dart';
import '../data/model/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepo(LoginWebServices())),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoadedLoginState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            appBar: AppBar(title: const Text('Login Screen')),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to our app',
                        style: TextStyle(fontSize: 22, color: Colors.blue),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: cubit.emailController,
                        errorMsg: 'Enter your email',
                        label: 'Email',
                        title: 'Email',
                        isEmail: true,
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: cubit.passwordController,
                        errorMsg: 'Enter your password',
                        label: 'Password',
                        title: 'Password',
                        isPassword: true,
                        icon: Icons.password,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            fixedSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: cubit.login,
                          child: const Text('Login'),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text("Don't have an account? Register"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
