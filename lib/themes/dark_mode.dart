import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 40, 39, 39), // Dark blue
    primary: Color(0xFFF2F5FF), // Dark grey,
    secondary: Color(0xFF5C56CC), // Light purple
    tertiary: Color(0xFF9E9E9E), // Grey
    onPrimary: Color(0xFF2EB895), // Green
    onSecondary: Color(0xFFF26B50), // Red
    surface: Color.fromARGB(255, 69, 69, 69),
    onSurface: Color(0xFFF2F5FF),
  ),
);
