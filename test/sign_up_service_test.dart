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

    // Create a new instance of the SignUpService class, passing in the test database.
    final signUpService = SignUpService(database: database);

    // Set up some test data.
    const email = 'test@test.com';
    const username = 'testuser';
    const password = 'password';

    // Call the signUp method of the service to create a new user.
    final result = await signUpService.signUp(email, username, password);

    // Verify that the user data returned by the signUp method matches the input data.
    expect(result.email, email);
    expect(result.username, username);

    // Clean up the test database after the test is complete.
    await database.delete('users');
    await database.close();
  });

  test('Sign up with duplicate username should return an error message',
      () async {
    // Create a new SQLite database and table for the test.
    final database = await testOpenDatabaseAndCreateTable();

    // Create a new instance of the SignUpService class, passing in the test database.
    final signUpService = SignUpService(database: database);

    // Set up some test data.
    const email = 'test2@example.com';
    const username = 'testuser';
    const password = 'password';

    // Call the signUp method of the service to create a new user with the same username as an existing user.
    final result1 = await signUpService.signUp(email, username, password);

    // Verify that the user data returned by the signUp method matches the input data.
    expect(result1.email, email);
    expect(result1.username, username);

    // Verify that the signUp method throws an exception when attempting to create a user with a duplicate username.
    expect(
      () async {
        await signUpService.signUp(email, username, password);
      },
      throwsA(isA<Exception>()),
    );

    // Clean up the test database after the test is complete.
    await database.delete('users');
    await database.close();
  });
}
