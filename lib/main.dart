import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/core/theme/dark_theme.dart';
import 'package:flutter_task_sign_app/core/theme/light_theme.dart';
import 'package:flutter_task_sign_app/features/home/provider/home_provider.dart';
import 'package:flutter_task_sign_app/features/onbording/screens/splash_screen.dart';
import 'package:flutter_task_sign_app/shared/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Language',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}
