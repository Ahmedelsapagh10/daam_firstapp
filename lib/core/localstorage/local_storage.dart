import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final asyncPrefs = SharedPreferencesAsync();

  Future<String?> getToken() async {
    return await asyncPrefs.getString('token');
  }

  Future<void> setToken(String? token) async {
    await asyncPrefs.setString('token', token ?? '');
  }
}
