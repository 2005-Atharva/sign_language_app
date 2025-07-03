class QuestionStep {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String responseIfCorrect;
  final String responseIfWrong;

  QuestionStep({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.responseIfCorrect,
    required this.responseIfWrong,
  });
}
