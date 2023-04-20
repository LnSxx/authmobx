import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// This function opens a database and creates a table for storing user data.
Future<Database> openDatabaseAndCreateTable() async {
  // Get the path to the app's databases directory.
  final databasePath = await getDatabasesPath();
  // Create a path for the app's database file.
  final path = join(databasePath, 'app.db');

  // Open the database file at the specified path.
  final database = await openDatabase(path);

  // Create a table for storing user data in the database.
  createTableUsers(database);

  // Return the opened database.
  return database;
}

// This function creates a table for storing user data in the specified database.
Future<void> createTableUsers(Database db) async {
  // Execute a SQL command to create the table if it doesn't already exist.
  await db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY,
          username TEXT UNIQUE NOT NULL,
          email TEXT UNIQUE NOT NULL,
          password TEXT NOT NULL
        )
      ''');
}

// This function opens an in-memory database and creates a table for testing purposes.
Future<Database> testOpenDatabaseAndCreateTable() async {
  // Open an in-memory database using the FFI database factory.
  Database database =
      await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
  // Create a table for storing user data in the database.
  await createTableUsers(database);

  // Return the opened database.
  return database;
}
