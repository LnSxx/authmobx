import 'package:authmobx/entities/user.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:sqflite/sqflite.dart';

// This abstract class defines the interface for a service that handles user sign up.
abstract class SignUpServiceInterface {
  Future<UserEntity> signUp(String email, String username, String password);
}

// This class implements the SignUpServiceInterface using SQFLite and bcrypt.
class SignUpService implements SignUpServiceInterface {
  final Database database;

  // The constructor takes a SQFLite database object as an argument, which is used to create a new user record.
  SignUpService({required this.database});

  // This function signs up a new user with the specified email, username, and password.
  @override
  Future<UserEntity> signUp(
      String email, String username, String password) async {
    // Hash the password using bcrypt.
    final String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
    // Insert the new user record into the database.
    final id = await database.insert(
      'users',
      {
        'email': email,
        'username': username,
        'password': hashed,
      },
    );
    // If the insert was not successful, throw an exception.
    if (id == 0) {
      throw Exception("Cannot sign up");
    }
    // Create a new UserEntity object with the inserted record's id, email, and username.
    return UserEntity(id: id, email: email, username: username);
  }
}
