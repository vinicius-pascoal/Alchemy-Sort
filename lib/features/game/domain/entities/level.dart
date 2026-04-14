import 'package:alchemy_sort/features/game/domain/entities/jar.dart';

class Level {
  const Level({
    required this.id,
    required this.difficulty,
    required this.estimatedMoves,
    required this.initialJars,
  });

  final int id;
  final String difficulty;
  final int estimatedMoves;
  final List<List<PotionType>> initialJars;
}
