import 'package:alchemy_sort/app/routes.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
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
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              final level = levels[index];
              final unlocked = progress.isUnlocked(level.id);
              final completed = progress.isCompleted(level.id);

              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: unlocked
                    ? () => Navigator.pushNamed(
                        context,
                        AppRoutes.game,
                        arguments: level,
                      )
                    : null,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fase ${level.id}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
                        Text('Dificuldade: ${level.difficulty}'),
                        Text('Meta: ${level.estimatedMoves} jogadas'),
                        const SizedBox(height: 8),
                        if (completed)
                          const Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.amber),
                              SizedBox(width: 6),
                              Text('Concluída'),
                            ],
                          ),
                      ],
                    ),
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
