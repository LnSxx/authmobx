import 'package:authmobx/pages/authorization_page.dart';
import 'package:authmobx/pages/home_page.dart';
import 'package:authmobx/stores/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthState>(context);
    return Observer(
      builder: (_) => authStore.currentUser != null
          ? const HomePage()
          : const AuthorizationPage(),
    );
  }
}
