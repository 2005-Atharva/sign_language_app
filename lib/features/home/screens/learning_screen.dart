import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/core/constants/assets.dart';
import 'package:flutter_task_sign_app/data/models/category_model.dart';
import 'package:lottie/lottie.dart';

class LearningScreen extends StatefulWidget {
  final List<CategoryModel> questions;
  final String categoryTitle;

  LearningScreen({required this.questions, required this.categoryTitle});

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  int currentIndex = 0;
  bool showFeedback = false;
  String feedbackText = '';

  void checkAnswer(String selected) {
    final correct = widget.questions[currentIndex].correctAnswer;
    final isCorrect = selected == correct;

    setState(() {
      showFeedback = true;
      feedbackText = isCorrect ? '✅ Correct!' : '❌ Try Again!';
    });

    Future.delayed(Duration(seconds: 1), () {
      if (currentIndex < widget.questions.length - 1) {
        setState(() {
          currentIndex++;
          showFeedback = false;
        });
      } else {
        // You can show a "Done" message or back
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text("Completed 🎉"),
            content: Text("You've completed this!!."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Pop LearningScreen
                },
                child: Text("Back to Home"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQ = widget.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle)),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(currentQ.gifPath), // Play GIF
            ),

            if (showFeedback)
              // Text(feedbackText, style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 150,
                child: Lottie.asset(
                  feedbackText.contains('Correct')
                      ? 'assets/images/correct.json'
                      : 'assets/images/wrong.json',
                ),
              ),

            // Lottie.asset(Assets.lottieIntro, height: 250, width: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: currentQ.options.map((option) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => checkAnswer(option),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            // if (showFeedback)
            //   // Text(feedbackText, style: TextStyle(fontSize: 20)),
            //   SizedBox(
            //     height: 150,
            //     child: Lottie.asset(
            //       feedbackText.contains('Correct')
            //           ? 'assets/images/correct.json'
            //           : 'assets/images/wrong.json',
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
