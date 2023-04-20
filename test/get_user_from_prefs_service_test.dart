import 'dart:convert';

import 'package:authmobx/entities/user.dart';
import 'package:authmobx/services/get_user_from_prefs_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Ensure that the test is run within the context of a running Flutter application.
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getUserFromPrefs should remove the user from SharedPreferences',
      () async {
    // Set up shared preferences with an empty Map before the test begins.
    SharedPreferences.setMockInitialValues({});

    // Obtain a new instance of the SharedPreferences class specific to the test.
    final sharedPreferences = await SharedPreferences.getInstance();

    // Create a new GetUserFromPrefsService instance and pass in the test SharedPreferences instance.
    final getUserService =
        GetUserFromPrefsService(sharedPreferences: sharedPreferences);

    // Create a new UserEntity object with some test data.
    final user =
        UserEntity(id: 1, email: 'user@example.com', username: 'username');

    // Convert the user data to JSON and save it to shared preferences.
    final userJson = user.toJson();
    await sharedPreferences.setString('user', jsonEncode(userJson));

    // Call the getUserFromPrefs method of the service to retrieve the saved user from shared preferences.
    final resUser = await getUserService.getUserFromPrefs();

    // Verify that the getUserFromPrefs method returns a non-null UserEntity object.
    expect(resUser, isNotNull);

    // Check retrieved user's data to match with added.
    final userFromPrefs = resUser!;
    expect(userFromPrefs.email, user.email);
    expect(userFromPrefs.id, user.id);
    expect(userFromPrefs.username, user.username);

    // Clear the shared preferences data after the test is complete.
    sharedPreferences.clear();
  });
}
