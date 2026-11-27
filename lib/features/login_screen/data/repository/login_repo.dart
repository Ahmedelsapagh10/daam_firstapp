import 'package:first_project/features/login_screen/data/model/login_model.dart';
import 'package:first_project/features/login_screen/data/web_services/login_web_services.dart';

class LoginRepo {
  LoginWebServices api;
  LoginRepo(this.api);

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final data = await api.login(email: email, password: password);
    return LoginModel.fromJson(data);
  }
}
