import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 14,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme(
    outline: Color(0xFF6371DE),
    outlineVariant: Color.fromARGB(255, 190, 198, 255),
    brightness: Brightness.light,
    primary: Color(0xFF1A5CFF),
    onPrimary: Colors.white,
    secondary: Color(0xFF1E293B),
    onSecondary: Colors.white,
    error: Color(0xFFE12E0D),
    onError: Color(0xFFE12E0D),
    background: Color(0xFF181818),
    onBackground: Color(0xFF1E293B),
    surface: Color(0xFF181818),
    onSurface: Color(0xFF1E293B),
  ),
);
