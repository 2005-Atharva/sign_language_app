import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/data/models/category_model.dart';
import 'package:flutter_task_sign_app/features/quiz/provider/level_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LearningScreen2 extends StatefulWidget {
  final List<CategoryModel> questions;
  final String categoryTitle;
  final int levelIndex;

  LearningScreen2({
    required this.questions,
    required this.categoryTitle,
    required this.levelIndex,
  });

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen2> {
  int currentIndex = 0;
  bool showFeedback = false;
  String feedbackText = '';
  final AudioPlayer _player = AudioPlayer();

  void playAnswerSound(bool isCorrect) async {
    await _player.stop(); // Stop if already playing
    final path = isCorrect ? 'images/ding.mp3' : 'images/error.mp3';
    await _player.play(AssetSource(path));
  }

  void checkAnswer(String selected) {
    final correct = widget.questions[currentIndex].correctAnswer;
    final isCorrect = selected == correct;

    playAnswerSound(isCorrect);

    setState(() {
      showFeedback = true;
      feedbackText = isCorrect ? '✅ Correct!' : '❌ Try Again!';
    });

    Future.delayed(Duration(seconds: 2), () async {
      if (currentIndex < widget.questions.length - 1) {
        setState(() {
          currentIndex++;
          showFeedback = false;
        });
      } else {
        // Unlock next level
        final levelProv = Provider.of<LevelProvider>(context, listen: false);
        await levelProv.unlock(widget.levelIndex + 1);

        if (!mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text("Completed 🎉"),
            content: Text("You've completed this!!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
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
  void dispose() {
    _player.dispose();
    super.dispose();
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
            Expanded(child: Image.asset(currentQ.gifPath)),
            if (showFeedback)
              SizedBox(
                height: 150,
                child: Lottie.asset(
                  feedbackText.contains('Correct')
                      ? 'assets/images/correct.json'
                      : 'assets/images/wrong.json',
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
