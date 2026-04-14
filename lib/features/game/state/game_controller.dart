import 'package:alchemy_sort/features/game/domain/entities/jar.dart';
import 'package:alchemy_sort/features/game/domain/entities/level.dart';
import 'package:alchemy_sort/features/game/domain/logic/puzzle_rules.dart';
import 'package:alchemy_sort/features/levels/data/level_repository.dart';
import 'package:flutter/foundation.dart';

class GameController extends ChangeNotifier {
  GameController(this.level) {
    _initialize();
  }

  final Level level;

  late List<Jar> jars;
  final List<_GameSnapshot> _history = <_GameSnapshot>[];
  int? selectedJarIndex;
  int moveCount = 0;
  bool isCompleted = false;

  void _initialize() {
    jars = level.initialJars
        .map(
          (layers) =>
              Jar(capacity: LevelRepository.jarCapacity, layers: layers),
        )
        .toList();
    selectedJarIndex = null;
    moveCount = 0;
    _history.clear();
    isCompleted = PuzzleRules.isVictory(jars);
  }

  void selectJar(int index) {
    if (isCompleted) {
      return;
    }

    if (selectedJarIndex == null) {
      if (jars[index].isEmpty) {
        return;
      }
      selectedJarIndex = index;
      notifyListeners();
      return;
    }

    if (selectedJarIndex == index) {
      selectedJarIndex = null;
      notifyListeners();
      return;
    }

    final fromIndex = selectedJarIndex!;
    final fromJar = jars[fromIndex];
    final toJar = jars[index];

    if (PuzzleRules.canTransfer(fromJar, toJar)) {
      _saveSnapshot();
      PuzzleRules.transferOne(fromJar, toJar);
      moveCount += 1;
      selectedJarIndex = null;
      isCompleted = PuzzleRules.isVictory(jars);
      notifyListeners();
      return;
    }

    selectedJarIndex = jars[index].isEmpty ? null : index;
    notifyListeners();
  }

  void undo() {
    if (_history.isEmpty || isCompleted) {
      return;
    }

    final previous = _history.removeLast();
    jars = previous.jarStates
        .map(
          (layers) =>
              Jar(capacity: LevelRepository.jarCapacity, layers: layers),
        )
        .toList();
    moveCount = previous.moveCount;
    selectedJarIndex = null;
    isCompleted = PuzzleRules.isVictory(jars);
    notifyListeners();
  }

  void restart() {
    _initialize();
    notifyListeners();
  }

  void _saveSnapshot() {
    _history.add(
      _GameSnapshot(
        jarStates: jars
            .map((jar) => List<PotionType>.from(jar.layers))
            .toList(),
        moveCount: moveCount,
      ),
    );
  }
}

class _GameSnapshot {
  _GameSnapshot({required this.jarStates, required this.moveCount});

  final List<List<PotionType>> jarStates;
  final int moveCount;
}
