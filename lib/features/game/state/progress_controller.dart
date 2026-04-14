import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressController extends ChangeNotifier {
  static const _keyUnlockedLevel = 'progress_unlocked_level';
  static const _keyCompletedLevels = 'progress_completed_levels';

  int _unlockedLevel = 1;
  final Set<int> _completedLevels = <int>{};

  int get unlockedLevel => _unlockedLevel;
  Set<int> get completedLevels => Set<int>.unmodifiable(_completedLevels);

  bool isUnlocked(int levelId) => levelId <= _unlockedLevel;
  bool isCompleted(int levelId) => _completedLevels.contains(levelId);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _unlockedLevel = prefs.getInt(_keyUnlockedLevel) ?? 1;
    final storedCompleted =
        prefs.getStringList(_keyCompletedLevels) ?? <String>[];
    _completedLevels
      ..clear()
      ..addAll(storedCompleted.map(int.parse));
    notifyListeners();
  }

  Future<void> markLevelCompleted(int levelId, int totalLevels) async {
    _completedLevels.add(levelId);

    if (levelId >= _unlockedLevel && _unlockedLevel < totalLevels) {
      _unlockedLevel = levelId + 1;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyUnlockedLevel, _unlockedLevel);
    await prefs.setStringList(
      _keyCompletedLevels,
      _completedLevels.map((id) => id.toString()).toList(),
    );

    notifyListeners();
  }

  Future<void> reset() async {
    _unlockedLevel = 1;
    _completedLevels.clear();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUnlockedLevel);
    await prefs.remove(_keyCompletedLevels);

    notifyListeners();
  }
}
