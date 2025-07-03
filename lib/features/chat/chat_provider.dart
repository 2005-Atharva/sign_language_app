import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/features/chat/chat_model.dart';

class KokoChatProvider extends ChangeNotifier {
  int currentStep = 0;
  List<Map<String, String>> chat = [];

  final List<QuestionStep> steps = [
    QuestionStep(
      question: "Hi, I'm Koko 🐨! What does this sign mean 👉?",
      options: ["Hello", "Bye"],
      correctIndex: 0,
      responseIfCorrect: "Yes! That's 'Hello' 👋",
      responseIfWrong: "Oops! It's actually 'Hello' 👋",
    ),
    QuestionStep(
      question: "And this sign? 🤟",
      options: ["Love", "Hate"],
      correctIndex: 0,
      responseIfCorrect: "You're right! That's 'Love' ❤️",
      responseIfWrong: "Not quite! It means 'Love' ❤️",
    ),
    QuestionStep(
      question: "What does this mean? 🙌",
      options: ["Thank You", "Sorry"],
      correctIndex: 0,
      responseIfCorrect: "Perfect! That's 'Thank You' 🙌",
      responseIfWrong: "Oops! Correct answer is 'Thank You' 🙌",
    ),
    // Add more here (up to 20 total)
  ];

  void handleUserChoice(int index) {
    if (currentStep >= steps.length) return;
    final step = steps[currentStep];
    final isCorrect = index == step.correctIndex;

    chat.add({"role": "koko", "text": step.question});
    chat.add({"role": "user", "text": step.options[index]});
    chat.add({
      "role": "koko",
      "text": isCorrect ? step.responseIfCorrect : step.responseIfWrong,
    });

    currentStep++;
    notifyListeners();
  }

  bool get hasNext => currentStep < steps.length;
  QuestionStep? get current => hasNext ? steps[currentStep] : null;
}
