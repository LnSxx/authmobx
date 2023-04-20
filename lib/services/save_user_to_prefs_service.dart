import 'dart:convert';

import 'package:authmobx/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SaveUserToPrefsServiceInterface {
  Future<void> saveUserToPrefs(UserEntity user);
}

class SaveUserToPrefsService implements SaveUserToPrefsServiceInterface {
  final SharedPreferences sharedPreferences;

  SaveUserToPrefsService({required this.sharedPreferences});

  @override
  Future<void> saveUserToPrefs(UserEntity user) async {
    final userJson = user.toJson();
    await sharedPreferences.setString('user', jsonEncode(userJson));
  }
}
