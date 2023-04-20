import 'package:authmobx/pages/root.dart';
import 'package:authmobx/themes/dark_theme.dart';
import 'package:authmobx/themes/light_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const RootPage(),
    );
  }
}
