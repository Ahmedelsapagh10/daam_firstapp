import 'package:first_project/core/widgets/custom_text_field.dart';
import 'package:first_project/features/register_screen/cubit/cubit.dart';
import 'package:first_project/features/register_screen/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return Scaffold(
            appBar: AppBar(title: const Text('Register Screen')),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create your account',
                        style: TextStyle(fontSize: 22, color: Colors.blue),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: cubit.nameController,
                        errorMsg: 'Enter your name',
                        label: 'Name',
                        title: 'Name',
                        icon: Icons.person_outline,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 16),
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
                          onPressed: cubit.register,
                          child: const Text('Register'),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Already have an account? Login'),
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
