import 'dart:convert';

import 'package:lazendeals/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static void setPreferences(String key, UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(key, jsonEncode(user));
  }

  static Future<UserModel?> getPreferences(String key, UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(key);
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(data);
  }
}
