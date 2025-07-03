import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/core/constants/assets.dart';
import 'package:flutter_task_sign_app/data/data_store/category_list.dart';
import 'package:flutter_task_sign_app/features/home/screens/learning_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Animals',
      'questions': animalQuestions,
      'image': 'assets/icons/animals.png',
    },
    {
      'title': 'Emergency',
      'questions': emergencyQuestions,
      'image': 'assets/icons/alarm.png',
    },
    {
      'title': 'Shapes',
      'questions': shapesQuestions,
      'image': 'assets/icons/shapes.png',
    },
    {
      'title': 'Emotions',
      'questions': emotionsQuestions,
      'image': 'assets/icons/emotions.png',
    },
    {
      'title': 'Food',
      'questions': foodQuestions,
      'image': 'assets/icons/food.png',
    },
    {
      'title': 'Expressions',
      'questions': expressionsQuestions,
      'image': 'assets/icons/expression.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: Color,
      appBar: AppBar(
        leading: Lottie.asset(Assets.lottieIntro, height: 32, width: 32),
        title: Text("Learn Signs With Koko"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LearningScreen(
                      questions: category['questions'],
                      categoryTitle: category['title'],
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.blue.shade100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(category['image'], scale: 6),
                      SizedBox(height: 4),
                      Text(
                        category['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
