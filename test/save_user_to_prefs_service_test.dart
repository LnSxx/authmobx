import 'dart:convert';

import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/save_user_to_prefs_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Ensure that the test is run within the context of a running Flutter application.
  TestWidgetsFlutterBinding.ensureInitialized();

  test('saveUserToPrefs should save the user to SharedPreferences', () async {
    // Set up shared preferences with an empty Map before the test begins.
    SharedPreferences.setMockInitialValues({});

    // Obtain a new instance of the SharedPreferences class specific to the test.
    final sharedPreferences = await SharedPreferences.getInstance();

    // Create a new SaveUserToPrefsService instance and pass in the test SharedPreferences instance.
    final saveUserService =
        SaveUserToPrefsService(sharedPreferences: sharedPreferences);

    // Create a new UserEntity object with some test data.
    final user =
        UserEntity(id: 1, email: 'user@example.com', username: 'username');

    // Call the saveUserToPrefs method of the service to save the user to shared preferences.
    await saveUserService.saveUserToPrefs(user);

    // Retrieve the saved user from shared preferences.
    final savedUserJson = sharedPreferences.getString('user');
    expect(savedUserJson, isNotNull);

    // Convert the saved user data from JSON to a Map and then back to a UserEntity object.
    final savedUserMap = jsonDecode(savedUserJson!);
    final savedUser = UserEntity.fromJson(savedUserMap);

    // Verify that the saved user data matches the original user data.
    expect(savedUser.id, equals(user.id));
    expect(savedUser.email, equals(user.email));
    expect(savedUser.username, equals(user.username));

    // Clear the shared preferences data after the test is complete.
    sharedPreferences.clear();
  });
}
