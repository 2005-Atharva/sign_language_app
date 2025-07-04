import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/features/home/screens/home_screen.dart';
import 'package:flutter_task_sign_app/features/quiz/screens/quiz_screen.dart';
import 'package:flutter_task_sign_app/features/setting/screens/setting_screen.dart';
import 'package:provider/provider.dart';
import 'navigation_provider.dart';

class BottomNav extends StatelessWidget {
  final List<Widget> _screens = [HomeScreen(), QuizScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.currentIndex;

    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => navigationProvider.changeTab(index),
        selectedItemColor: const Color.fromARGB(255, 0, 194, 26),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
