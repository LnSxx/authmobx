// ignore_for_file: library_private_types_in_public_api

import 'package:authmobx/stores/auth/auth_state.dart';
import 'package:authmobx/usecases/log_in_usecase.dart';
import 'package:authmobx/usecases/sign_up_usecase.dart';
import 'package:mobx/mobx.dart';

part 'auth_page_state.g.dart';

class AuthPageState = _AuthPageStateBase with _$AuthPageState;

enum AuthFormState {
  login,
  signup,
}

abstract class _AuthPageStateBase with Store {
  final AuthState authStore;
  final SignUpUsecaseInterface signUpUsecase;
  final LogInUsecaseInterface logInUsecase;

  _AuthPageStateBase({
    required this.authStore,
    required this.signUpUsecase,
    required this.logInUsecase,
  });

  @observable
  AuthFormState formState = AuthFormState.login;

  @observable
  String email = '';

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void switchForm() {
    switch (formState) {
      case AuthFormState.login:
        formState = AuthFormState.signup;
        break;
      case AuthFormState.signup:
        formState = AuthFormState.login;
    }
    email = '';
    username = '';
    password = '';
  }

  @action
  Future<void> submitForm() async {
    isError = false;
    isLoading = true;
    switch (formState) {
      case AuthFormState.login:
        try {
          final user = await logInUsecase.execute(username, password);
          await authStore.authorize(user);
        } catch (err) {
          isError = true;
        }
        break;
      case AuthFormState.signup:
        try {
          final user = await signUpUsecase.execute(email, username, password);
          await authStore.authorize(user);
        } catch (err) {
          isError = true;
        }
    }
    isLoading = false;
  }
}
