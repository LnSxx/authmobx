import 'package:authmobx/components/button.dart';
import 'package:authmobx/components/input.dart';
import 'package:authmobx/components/input_group.dart';
import 'package:authmobx/components/text_button.dart';
import 'package:authmobx/stores/auth_form/auth_page_state.dart';
import 'package:authmobx/validators/email_validator.dart';
import 'package:authmobx/validators/password_validator.dart';
import 'package:authmobx/validators/username_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AuthorizationForm extends StatefulWidget {
  const AuthorizationForm({super.key});

  @override
  AuthorizationFormState createState() => AuthorizationFormState();
}

class AuthorizationFormState extends State<AuthorizationForm> {
  final _logInFormKey = GlobalKey<FormState>();
  final _usernameController1 = TextEditingController();
  final _passwordController1 = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();
  final _emailController2 = TextEditingController();
  final _usernameController2 = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  void dispose() {
    _usernameController1.dispose();
    _passwordController1.dispose();
    _emailController2.dispose();
    _usernameController2.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  void onLogInButtonTapped(AuthPageState state) {
    if (state.formState == AuthFormState.login) {
      _logInFormKey.currentState!.validate();
      if (_logInFormKey.currentState!.validate()) {
        state.setUsername(_usernameController1.text);
        state.setPassword(_passwordController1.text);
        state.submitForm();
      }
    } else {
      state.switchForm();
      _usernameController1.clear();
      _passwordController1.clear();
    }
  }

  void onSignUpButtonTapped(AuthPageState state) {
    if (state.formState == AuthFormState.signup) {
      if (_signUpFormKey.currentState!.validate()) {
        state.setEmail(_emailController2.text);
        state.setUsername(_usernameController2.text);
        state.setPassword(_passwordController2.text);
        state.submitForm();
      }
    } else {
      state.switchForm();
      _emailController2.clear();
      _usernameController2.clear();
      _passwordController2.clear();
    }
  }

  Widget buildSubmitButton({
    required AuthPageState state,
    required String caption,
    required void Function() onPressed,
    required AuthFormState type,
    required ThemeData theme,
  }) {
    return Expanded(
      child: Button(
          onTap: onPressed,
          caption: caption,
          color: (state.formState == type)
              ? theme.colorScheme.primary
              : Colors.transparent,
          showLoader: (state.formState == type && state.isLoading),
          textStyle: (state.formState == type)
              ? theme.textTheme.bodySmall
              : theme.textTheme.titleSmall),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authorizePageState = Provider.of<AuthPageState>(context);
    final theme = Theme.of(context);
    return Observer(
      builder: (_) {
        if (authorizePageState.isError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Failed to authorize',
                  style: theme.textTheme.labelMedium,
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          });
        }
        return Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(
                        authorizePageState.formState == AuthFormState.login
                            ? -1.0
                            : 1.0,
                        0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: authorizePageState.formState == AuthFormState.login
                  ? InputGroup(
                      formKey: _logInFormKey,
                      key: const ValueKey('login'),
                      inputs: [
                        Input(
                          hintText: "Username",
                          controller: _usernameController1,
                          validator: (value) {
                            return validateUsername(value ?? "");
                          },
                        ),
                        Input(
                          hintText: "Password",
                          controller: _passwordController1,
                          validator: (value) {
                            return validatePasswordCheckLengthOnly(value ?? "");
                          },
                          obscureText: true,
                        ),
                      ],
                    )
                  : InputGroup(
                      formKey: _signUpFormKey,
                      key: const ValueKey('signup'),
                      inputs: [
                        Input(
                          hintText: "Email",
                          controller: _emailController2,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            return validateEmail(value ?? "");
                          },
                        ),
                        Input(
                          hintText: "Username",
                          controller: _usernameController2,
                          validator: (value) {
                            return validateUsername(value ?? "");
                          },
                        ),
                        Input(
                          hintText: "Password",
                          controller: _passwordController2,
                          validator: (value) {
                            return validatePassword(value ?? "");
                          },
                          obscureText: true,
                        ),
                      ],
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theme.colorScheme.secondary,
              ),
              child: Row(
                children: [
                  // Login button
                  buildSubmitButton(
                    state: authorizePageState,
                    caption: "Login",
                    onPressed: () => onLogInButtonTapped(authorizePageState),
                    type: AuthFormState.login,
                    theme: theme,
                  ),
                  // Sign-up button
                  buildSubmitButton(
                    state: authorizePageState,
                    caption: "Sign-up",
                    onPressed: () => onSignUpButtonTapped(authorizePageState),
                    type: AuthFormState.signup,
                    theme: theme,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 52),
              child: TButton(
                onPressed: () {},
                text: "Forgot password?",
              ),
            )
          ],
        );
      },
    );
  }
}
