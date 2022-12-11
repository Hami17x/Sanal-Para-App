import 'package:shared_preferences/shared_preferences.dart';

mixin CacheManager {
  Future<bool> saveLogin(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", isLoggedIn);
    return true;
  }

  Future<bool?> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn");
  }
}
