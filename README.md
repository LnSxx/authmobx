# Authmobx

This mobile app is a custom authentication system that allows users to sign up and sign in. The app uses SQLite to store user data, with a table that contains user information such as username, email, and a BCrypt-hashed password for security.

## Features

* User sign up: allows users to create a new account with a UNIQUE username and email.
* User sign in: allows users to sign in to their account using their username and password.
* Secure password storage: uses BCrypt to hash and salt user passwords for secure storage in the database.

## Installation
To install the app, follow these steps:

1. Clone the repository to your local machine.
2. Install Flutter and Dart on your machine if you haven't already.
3. Open the project in your preferred IDE.
4. Run the app on an emulator or physical device.

## Usage
To use the app, follow these steps:

1. Open the app on your device.
2. Create a new account by entering a unique username, email, and password.
3. Sign in to your account using your email and password.
4. View and edit your account information as needed.

## Development 

# Architecture

The app's architecture is based on the following components:

- Services: The app's services are responsible for interacting with the database and SharedPreferences to perform create and read operations on user data. The services are located in the ```services``` folder and include ```SignUpService```, ```LogInService```, ```SaveUserToPrefsService```, ```GetUserFromPrefsService```, and ```RemoveUserFromPrefsService```. All ```service``` implementations should conform to corresponding ```service interfaces```.

- Use cases: The app's use cases are responsible for implementing business logic and coordinating interactions between services. The usecases are located in the ```usecases``` folder and include ```SignUpUsecase```, ```LogInUsecase```, ```SaveUserToPrefsUsecase```, ```GetUserFromPrefsUsecase```, and ```RemoveUserFromPrefsUsecase```. All ```usecases``` implementations should conform to corresponding ```usecase interfaces```.

- MobX states: The app's MobX states are responsible for managing the app's state and coordinating interactions between the UI and the use cases. The MobX states are located in the ```stores``` folder and include AuthState and AccountState.

# Storage

The app uses two types of storage to manage user data:

* SQLite: The app uses SQLite to store user account information, including the user's ID, email, username, and hashed password. The table schema for the users table is shown below:

| Column   | Type     | Constraints     |
|----------|----------|----------------|
| id       | INTEGER  | PRIMARY KEY     |
| email    | TEXT     | UNIQUE NOT NULL |
| username | TEXT     | UNIQUE NOT NULL |
| password | TEXT     | NOT NULL       |


* SharedPreferences: The app uses SharedPreferences to store the current user that logged in.

# Entities

The app has only one entity:

```UserEntity```: Represents a user account and contains the user's ID, email, username, and hashed password. The entity is located in the entities folder.

The app does not use separate DTO or domain objects, as the app's logic is simple and the data model is straightforward. The app works directly with the UserEntity object to store, retrieve, and manipulate user data.

# Test

The app's tests are located in the tests folder and include tests for each service. To run the tests, simply run the following command in the terminal:

```flutter test```




