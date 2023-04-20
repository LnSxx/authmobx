import 'package:authmobx/services/log_in_service.dart';
import 'package:authmobx/services/sign_up_service.dart';
import 'package:authmobx/storage/database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  // Ensure that the test is run within the context of a running Flutter application.
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize the SQLite database engine for the test.
  sqfliteFfiInit();

  test('Sign up with valid data should return a UserEntity', () async {
    // Create a new SQLite database and table for the test.
    final database = await testOpenDatabaseAndCreateTable();

    // Create new instances of the SignUpService and LogInService classes, passing in the test database.
    final signUpService = SignUpService(database: database);
    final logInService = LogInService(database: database);

    // Set up some test data.
    const email = 'test@test.com';
    const username = 'testuser';
    const password = 'password';

    // Call the signUp method of the service to create a new user.
    final result = await signUpService.signUp(email, username, password);

    // Call the logIn method of the service to retrieve the newly created user.
    final user = await logInService.logIn(username, password);

    // Verify that the user data returned by the signUp and logIn methods matches.
    expect(user.email, result.email);
    expect(user.username, result.username);

    // Verify that the logIn method throws an exception with an error message when an incorrect password is used.
    expect(
      () async {
        await logInService.logIn(username, 'incorrectpassword');
      },
      throwsA(
        isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Log in failed'),
        ),
      ),
    );

    // Verify that the logIn method throws an exception with an error message when an incorrect username and password are used.
    expect(
      () async {
        await logInService.logIn('incorrectusername', 'incorrectpassword');
      },
      throwsA(
        isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Log in failed'),
        ),
      ),
    );

    // Clean up the test database after the test is complete.
    await database.delete('users');
    await database.close();
  });
}
