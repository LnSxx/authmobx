import 'package:authmobx/stores/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthState>(context, listen: false);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Current user"),
          Text("EMAIL: ${authStore.currentUser!.email}"),
          Text("USERNAME: ${authStore.currentUser!.username}"),
          Text("ID: ${authStore.currentUser!.id.toString()}"),
          ElevatedButton(
            onPressed: () async {
              await authStore.unauthorize();
            },
            child: const Text('Logout'),
          )
        ],
      )),
    );
  }
}
