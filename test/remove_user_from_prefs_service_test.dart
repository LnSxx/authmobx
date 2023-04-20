import 'dart:convert';

import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/remove_user_from_prefs_service_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Ensure that the test is run within the context of a running Flutter application.
  TestWidgetsFlutterBinding.ensureInitialized();

  test('removeUserFromPrefs should remove the user from SharedPreferences',
      () async {
    // Set up shared preferences with an empty Map before the test begins.
    SharedPreferences.setMockInitialValues({});

    // Obtain a new instance of the SharedPreferences class specific to the test.
    final sharedPreferences = await SharedPreferences.getInstance();

    // Create a new RemoveUserFromPrefsService instance and pass in the test SharedPreferences instance.
    final removeUserService =
        RemoveUserFromPrefsService(sharedPreferences: sharedPreferences);

    // Create a new UserEntity object with some test data.
    final user =
        UserEntity(id: 1, email: 'user@example.com', username: 'username');

    // Convert the UserEntity object to a JSON Map and save it to shared preferences.
    final userJson = user.toJson();
    await sharedPreferences.setString('user', jsonEncode(userJson));

    // Call the removeUserFromPrefs method of the service to remove the user from shared preferences.
    await removeUserService.removeUserFromPrefs();

    // Verify that the user data has been removed from shared preferences.
    final savedUserJson = sharedPreferences.getString('user');
    expect(savedUserJson, isNull);

    // Clear the shared preferences data after the test is complete.
    sharedPreferences.clear();
  });
}
