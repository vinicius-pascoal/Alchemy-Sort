import 'package:alchemy_sort/app/routes.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
import 'package:alchemy_sort/core/widgets/pixel_frame_panel.dart';
import 'package:alchemy_sort/features/game/state/progress_controller.dart';
import 'package:alchemy_sort/features/levels/data/level_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArcaneBackground(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PixelFramePanel(
                frame: PixelFrame.highlighted,
                constraints: const BoxConstraints(minWidth: 280),
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Alchemy Sort',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.4,
                        shadows: [
                          Shadow(
                            color: Color(0xCC000000),
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ordene os elixires e domine o laboratório arcano',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: Colors.white.withAlpha(225),
                      ),
                    ),
                    const SizedBox(height: 28),
                    ElevatedButton(
                      onPressed: () {
                        final levels = LevelRepository.levels;
                        if (levels.isEmpty) {
                          Navigator.pushNamed(context, AppRoutes.levels);
                          return;
                        }

                        final unlockedLevel = context
                            .read<ProgressController>()
                            .unlockedLevel;
                        final latestUnlockedIndex = (unlockedLevel - 1)
                            .clamp(0, levels.length - 1)
                            .toInt();
                        final latestUnlockedLevel = levels[latestUnlockedIndex];

                        Navigator.pushNamed(
                          context,
                          AppRoutes.game,
                          arguments: latestUnlockedLevel,
                        );
                      },
                      child: const Text('Jogar'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.levels),
                      child: const Text('Fases'),
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.settings),
                      icon: const Icon(Icons.settings_outlined),
                      label: const Text('Configurações'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
