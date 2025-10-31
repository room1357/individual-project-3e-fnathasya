import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class PreferencesHelper {
  static const String userKey = 'user_data';
  static const String regUserKey = 'registered_username';
  static const String regPassKey = 'registered_password';
  static const String isLoggedKey = 'isLoggedIn';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = jsonEncode(user.toJson());
    await prefs.setString(userKey, userData);
    // compatibility keys
    await prefs.setString('username', user.username);
    await prefs.setBool(isLoggedKey, true);
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(userKey);
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    final uname = prefs.getString('username');
    if (uname != null) {
      return User(username: uname);
    }
    return null;
  }

  static Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(regUserKey, username);
    await prefs.setString(regPassKey, password);
  }

  static Future<bool> checkCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final ru = prefs.getString(regUserKey);
    final rp = prefs.getString(regPassKey);
    return ru == username && rp == password;
  }

  static Future<void> setLoggedOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedKey, false);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}