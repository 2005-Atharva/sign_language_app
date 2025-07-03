import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/core/constants/assets.dart';
import 'package:flutter_task_sign_app/data/data_store/quiz_list.dart';
import 'package:flutter_task_sign_app/features/quiz/provider/level_provider.dart';
import 'package:flutter_task_sign_app/features/quiz/quiz_learn_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Quize 1',
      'questions': quiz1,
      'image': 'assets/icons/animals.png',
    },
    {'title': 'Quize 2', 'questions': quiz2, 'image': 'assets/icons/alarm.png'},
    {
      'title': 'Quize 3',
      'questions': quiz3,
      'image': 'assets/icons/shapes.png',
    },
    {
      'title': 'Quize 4',
      'questions': quiz4,
      'image': 'assets/icons/emotions.png',
    },
    {'title': 'Quize 5', 'questions': quiz5, 'image': 'assets/icons/food.png'},
    {
      'title': 'Quize 6',
      'questions': quiz6,
      'image': 'assets/icons/expression.png',
    },
    {'title': 'Quize 7', 'questions': quiz7, 'image': 'assets/icons/food.png'},
    {'title': 'Quize 8', 'questions': quiz8, 'image': 'assets/icons/food.png'},
    {
      'title': 'Quize 9',
      'questions': quiz4,
      'image': 'assets/icons/emotions.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Lottie.asset(Assets.lottieIntro, height: 32, width: 32),
        title: Text("Practice Signs With Koko"),
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
            return Consumer<LevelProvider>(
              builder: (ctx, levelProv, _) {
                final unlocked = levelProv.isUnlocked(index);
                return GestureDetector(
                  onTap: unlocked
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LearningScreen2(
                                questions: category['questions'],
                                categoryTitle: category['title'],
                                levelIndex: index,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Card(
                    color: unlocked
                        ? Colors.blue.shade100
                        : Colors.grey.shade300,
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/quiz.png', scale: 6),
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
                        if (!unlocked)
                          Positioned.fill(
                            child: Container(
                              color: Colors.white.withOpacity(0.7),
                              child: Icon(
                                Icons.lock,
                                size: 48,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
