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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Lottie.asset(Assets.lottieIntro, height: 32, width: 32),
        title: Text(
          "Learn Signs With Koko",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 0),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // childAspectRatio: 1.4,
              // crossAxisSpacing: 12,
              // mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: GestureDetector(
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
                  child: Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      // color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage('assets/images/button_quiz.png'),
                        fit: BoxFit.fill,
                      ),
                    ),

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(category['image'], scale: 7),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
