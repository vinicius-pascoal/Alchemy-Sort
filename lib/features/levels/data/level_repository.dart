import 'package:alchemy_sort/features/game/domain/entities/jar.dart';
import 'package:alchemy_sort/features/game/domain/entities/level.dart';

class LevelRepository {
  static const int jarCapacity = 4;

  static final List<Level> levels = [
    Level(
      id: 1,
      difficulty: 'Fácil',
      estimatedMoves: 8,
      initialJars: const [
        [PotionType.amethyst, PotionType.sapphire],
        [PotionType.sapphire, PotionType.amethyst],
        [],
      ],
    ),
    Level(
      id: 2,
      difficulty: 'Fácil',
      estimatedMoves: 12,
      initialJars: const [
        [PotionType.amethyst, PotionType.sapphire, PotionType.emerald],
        [PotionType.emerald, PotionType.sapphire, PotionType.amethyst],
        [PotionType.sapphire, PotionType.amethyst, PotionType.emerald],
        [],
      ],
    ),
    Level(
      id: 3,
      difficulty: 'Médio',
      estimatedMoves: 18,
      initialJars: const [
        [
          PotionType.amethyst,
          PotionType.sapphire,
          PotionType.emerald,
          PotionType.ruby,
        ],
        [
          PotionType.ruby,
          PotionType.emerald,
          PotionType.sapphire,
          PotionType.amethyst,
        ],
        [
          PotionType.sapphire,
          PotionType.amethyst,
          PotionType.ruby,
          PotionType.emerald,
        ],
        [
          PotionType.emerald,
          PotionType.ruby,
          PotionType.amethyst,
          PotionType.sapphire,
        ],
        [],
        [],
      ],
    ),
    Level(
      id: 4,
      difficulty: 'Médio',
      estimatedMoves: 22,
      initialJars: const [
        [
          PotionType.cyan,
          PotionType.amber,
          PotionType.emerald,
          PotionType.sapphire,
        ],
        [
          PotionType.sapphire,
          PotionType.cyan,
          PotionType.amber,
          PotionType.emerald,
        ],
        [
          PotionType.emerald,
          PotionType.silver,
          PotionType.cyan,
          PotionType.amber,
        ],
        [
          PotionType.amber,
          PotionType.emerald,
          PotionType.silver,
          PotionType.cyan,
        ],
        [
          PotionType.silver,
          PotionType.sapphire,
          PotionType.amber,
          PotionType.sapphire,
        ],
        [],
        [],
      ],
    ),
  ];
}
