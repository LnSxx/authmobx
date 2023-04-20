import 'package:authmobx/entities/user.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:sqflite/sqflite.dart';

abstract class LogInServiceInterface {
  Future<UserEntity> logIn(String username, String password);
}

class LogInService implements LogInServiceInterface {
  final Database database;

  LogInService({required this.database});

  @override
  Future<UserEntity> logIn(String username, String password) async {
    try {
      // Get the user from the database with the matching username
      final List<Map<String, dynamic>> results = await database.query(
        'users',
        where: 'username = ?',
        whereArgs: [username],
        limit: 1,
      );

      if (results.isNotEmpty) {
        // Get the first (and only) user from the results list
        final user = results.first;

        // Check if the password matches the hashed password stored in the database
        if (BCrypt.checkpw(password, user['password'])) {
          // Return a new UserEntity object with the user's data
          return UserEntity(
            id: user['id'],
            email: user['email'],
            username: user['username'],
          );
        }
      }
      // If the username or password is incorrect, throw an exception
      throw Exception('Invalid username or password');
    } catch (e) {
      throw Exception('Log in failed');
    }
  }
}
