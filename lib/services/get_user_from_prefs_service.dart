import 'dart:convert';

import 'package:authmobx/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetUserFromPrefsServiceInterface {
  Future<UserEntity?> getUserFromPrefs();
}

class GetUserFromPrefsService implements GetUserFromPrefsServiceInterface {
  final SharedPreferences sharedPreferences;

  GetUserFromPrefsService({required this.sharedPreferences});

  @override
  Future<UserEntity?> getUserFromPrefs() async {
    final userJson = sharedPreferences.getString('user');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      return UserEntity.fromJson(userMap);
    } else {
      return null;
    }
  }
}
