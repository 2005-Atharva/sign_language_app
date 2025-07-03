import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Color.fromARGB(255, 48, 133, 254),

  colorScheme: ColorScheme.dark(
    primary: Color.fromARGB(255, 48, 133, 254), // Primary color
    secondary: Color.fromARGB(40, 48, 134, 254), // Secondary color
    tertiary: Colors.grey[700]!, // Darker grey for contrast
    surface: Colors.grey[900]!, // Very dark surface color
  ),
);
