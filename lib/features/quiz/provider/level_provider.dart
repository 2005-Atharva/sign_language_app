import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelProvider extends ChangeNotifier {
  static const int totalLevels = 7; // update if you change number of quizzes
  final List<bool> _unlocked = List.generate(totalLevels, (i) => i == 0);

  LevelProvider() {
    _loadUnlocked();
  }

  Future<void> _loadUnlocked() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < totalLevels; i++) {
      _unlocked[i] = prefs.getBool('level_$i') ?? (i == 0);
    }
    notifyListeners();
  }

  bool isUnlocked(int level) {
    return level >= 0 && level < totalLevels && _unlocked[level];
  }

  Future<void> unlock(int level) async {
    if (level < 0 || level >= totalLevels) return;
    if (!_unlocked[level]) {
      _unlocked[level] = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('level_$level', true);
      notifyListeners();
    }
  }
}
