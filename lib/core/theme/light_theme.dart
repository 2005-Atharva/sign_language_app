import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color.fromARGB(255, 48, 133, 254),

  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(255, 48, 134, 254), // Primary color
    secondary: Color.fromARGB(40, 48, 134, 254), // Secondary color
    tertiary: Colors.grey[300]!,
    surface: Colors.grey[100]!,
  ),
);
