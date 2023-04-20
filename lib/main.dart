import 'package:authmobx/app/app.dart';
import 'package:authmobx/services/get_user_from_prefs_service.dart';
import 'package:authmobx/services/remove_user_from_prefs_service_service.dart';
import 'package:authmobx/services/save_user_to_prefs_service.dart';
import 'package:authmobx/storage/database.dart';
import 'package:authmobx/stores/auth/auth_state.dart';
import 'package:authmobx/usecases/get_user_from_prefs_usecase.dart';
import 'package:authmobx/usecases/remove_user_from_prefs_usecase.dart';
import 'package:authmobx/usecases/save_user_to_prefs_usecase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  // Wait for SharedPreferences to be initialized
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  final db = await openDatabaseAndCreateTable();

  // Create services and usecases
  final saveUserToPrefsService = SaveUserToPrefsService(
    sharedPreferences: sp,
  );
  final getUserFromPrefsService = GetUserFromPrefsService(
    sharedPreferences: sp,
  );
  final removeUserFromPrefsService = RemoveUserFromPrefsService(
    sharedPreferences: sp,
  );

  final saveUserToPrefsUsecase = SaveUserToPrefsUsecase(
    service: saveUserToPrefsService,
  );
  final getUserFromPrefsUsecase = GetUserFromPrefsUsecase(
    service: getUserFromPrefsService,
  );
  final removeUserFromPrefsUsecase = RemoveUserFromPrefsUsecase(
    service: removeUserFromPrefsService,
  );

  // Create stores
  final authStore = AuthState(
    saveUserToPrefsUsecase: saveUserToPrefsUsecase,
    getUserFromPrefsUsecase: getUserFromPrefsUsecase,
    removeUserFromPrefsUsecase: removeUserFromPrefsUsecase,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthState>.value(value: authStore),
        Provider<Database>.value(value: db),
      ],
      child: const App(),
    ),
  );
}
