import 'package:first_project/core/localstorage/local_storage.dart';
import 'package:first_project/features/login_screen/data/model/login_model.dart';
import 'package:first_project/features/main_screen/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../data/repository/login_repo.dart';
import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(InitialLoginState());
  LoginRepo repo;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      emit(LoadingLoginState());
      LoginModel data = await repo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (data.success == true) {
        await LocalStorage().setToken(data.token);

        emit(LoadedLoginState());
      } else {
        toastification.show(
          title: Text(data.message ?? ''),
          backgroundColor: Colors.red,
        );
        emit(ErrorLoginState());
      }
    }
    // emit(LoginValidationState(isValid));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
