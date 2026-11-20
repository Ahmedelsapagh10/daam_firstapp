import 'package:shared_preferences/shared_preferences.dart';

class MyLocalStorage {
  //! store  + get + delete

  void setEmail(String email) async {
    final prefs = SharedPreferencesAsync();

    await prefs.setString('email', email);
  }

  void setPassword(String password) async {
    final prefs = SharedPreferencesAsync();

    await prefs.setString('password', password);
  }

  Future<String?> getEmail() async {
    final prefs = SharedPreferencesAsync();

    return await prefs.getString('email');
  }

  Future<String?> getPassword() async {
    final prefs = SharedPreferencesAsync();

    return await prefs.getString('password');
  }

  Future<void> clearUserData() async {
    final prefs = SharedPreferencesAsync();
    await prefs.clear();
  }
}

/*

'email':ahmed@gmail.com
'password':123
*/
