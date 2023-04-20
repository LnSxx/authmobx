import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 14,
      color: Color(0xFF1A5CFF),
    ),
    bodySmall: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 14,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: 'TTNorms',
      fontSize: 14,
      color: Colors.black,
    ),
  ),
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme(
    outline: Color(0xFF6371DE),
    outlineVariant: Color.fromARGB(255, 103, 119, 241),
    brightness: Brightness.light,
    primary: Color(0xFF1A5CFF),
    onPrimary: Colors.white,
    secondary: Color(0xFFBFDBFE),
    onSecondary: Colors.black,
    error: Color(0xFFE12E0D),
    onError: Color(0xFFE12E0D),
    background: Color(0xFFF9F9F9),
    onBackground: Color(0xFFBFDBFE),
    surface: Color(0xFFF9F9F9),
    onSurface: Color(0xFFBFDBFE),
  ),
);
