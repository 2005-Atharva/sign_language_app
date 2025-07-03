class CategoryModel {
  final String gifPath; // local asset path
  final String correctAnswer;
  final List<String> options;

  CategoryModel({
    required this.gifPath,
    required this.correctAnswer,
    required this.options,
  });
}
