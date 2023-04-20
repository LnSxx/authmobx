import 'package:authmobx/features/authorization/authorization_form.dart';
import 'package:authmobx/features/authorization/authorization_page_layout.dart';
import 'package:authmobx/services/log_in_service.dart';
import 'package:authmobx/services/sign_up_service.dart';
import 'package:authmobx/stores/auth/auth_state.dart';
import 'package:authmobx/stores/auth_form/auth_page_state.dart';
import 'package:authmobx/usecases/log_in_usecase.dart';
import 'package:authmobx/usecases/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthState>(context, listen: false);
    final db = Provider.of<Database>(context, listen: false);
    final SignUpService signUpService = SignUpService(database: db);
    final LogInService logInService = LogInService(database: db);
    final SignUpUsecase signUpUsecase = SignUpUsecase(service: signUpService);
    final LogInUsecase logInUsecase = LogInUsecase(service: logInService);
    final authorizePageState = AuthPageState(
      authStore: authStore,
      signUpUsecase: signUpUsecase,
      logInUsecase: logInUsecase,
    );
    return Provider<AuthPageState>.value(
      value: authorizePageState,
      child: const AuthorizationPageLayout(
        form: AuthorizationForm(),
      ),
    );
  }
}
