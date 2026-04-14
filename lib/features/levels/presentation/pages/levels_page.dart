import 'package:alchemy_sort/app/routes.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
import 'package:alchemy_sort/core/widgets/pixel_frame_panel.dart';
import 'package:alchemy_sort/features/levels/data/level_repository.dart';
import 'package:alchemy_sort/features/game/state/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressController>();
    final levels = LevelRepository.levels;

    return Scaffold(
      appBar: AppBar(title: const Text('Seleção de Fases')),
      body: ArcaneBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: levels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final level = levels[index];
              final unlocked = progress.isUnlocked(level.id);
              final completed = progress.isCompleted(level.id);

              return GestureDetector(
                onTap: unlocked
                    ? () => Navigator.pushNamed(
                        context,
                        AppRoutes.game,
                        arguments: level,
                      )
                    : null,
                child: PixelFramePanel(
                  frame: PixelFrame.dark,
                  constraints: const BoxConstraints(minHeight: 170),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Fase ${level.id}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            unlocked
                                ? Icons.lock_open_rounded
                                : Icons.lock_rounded,
                            color: unlocked
                                ? Colors.greenAccent
                                : Colors.white54,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Dificuldade: ${level.difficulty}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Meta: ${level.estimatedMoves} jogadas',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 6),
                      if (completed)
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Colors.amber),
                            SizedBox(width: 6),
                            Text('Concluída'),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
