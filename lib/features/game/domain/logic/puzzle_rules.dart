import 'package:alchemy_sort/features/game/domain/entities/jar.dart';

class PuzzleRules {
  static bool canTransfer(Jar from, Jar to) {
    if (from.isEmpty || to.isFull) {
      return false;
    }

    if (to.isEmpty) {
      return true;
    }

    return from.top == to.top;
  }

  static bool transferOne(Jar from, Jar to) {
    if (!canTransfer(from, to)) {
      return false;
    }

    final movedPotion = from.layers.removeLast();
    to.layers.add(movedPotion);
    return true;
  }

  static bool isVictory(List<Jar> jars) {
    return jars.every((jar) => jar.isEmpty || jar.isUniform);
  }
}
