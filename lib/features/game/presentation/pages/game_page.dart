import 'package:alchemy_sort/features/game/domain/entities/level.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
import 'package:alchemy_sort/core/widgets/pixel_frame_panel.dart';
import 'package:alchemy_sort/features/game/presentation/widgets/jar_widget.dart';
import 'package:alchemy_sort/features/game/state/game_controller.dart';
import 'package:alchemy_sort/features/game/state/progress_controller.dart';
import 'package:alchemy_sort/features/levels/data/level_repository.dart';
import 'package:alchemy_sort/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.level});

  final Level level;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final GameController _controller;
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    _controller = GameController(widget.level)..addListener(_onGameUpdate);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onGameUpdate)
      ..dispose();
    super.dispose();
  }

  Future<void> _onGameUpdate() async {
    if (!_controller.isCompleted || _dialogShown || !mounted) {
      return;
    }

    _dialogShown = true;
    await context.read<ProgressController>().markLevelCompleted(
      widget.level.id,
      LevelRepository.levels.length,
    );

    if (!mounted) {
      return;
    }

    final hasNext = widget.level.id < LevelRepository.levels.length;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Fase concluída!'),
        content: Text('Você venceu em ${_controller.moveCount} movimentos.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Voltar'),
          ),
          if (hasNext)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.game,
                  arguments: LevelRepository.levels[widget.level.id],
                );
              },
              child: const Text('Próxima fase'),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fase ${widget.level.id}'),
        actions: [
          IconButton(
            tooltip: 'Reiniciar',
            onPressed: () {
              _dialogShown = false;
              _controller.restart();
            },
            icon: const Icon(Icons.replay_rounded),
          ),
          IconButton(
            tooltip: 'Desfazer',
            onPressed: _controller.undo,
            icon: const Icon(Icons.undo_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return ArcaneBackground(
            child: Column(
              children: [
                const SizedBox(height: 8),
                PixelFramePanel(
                  frame: PixelFrame.highlighted,
                  constraints: const BoxConstraints(
                    minWidth: 280,
                    minHeight: 76,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      'Movimentos: ${_controller.moveCount}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 14,
                          runSpacing: 16,
                          children: List.generate(_controller.jars.length, (
                            index,
                          ) {
                            return JarWidget(
                              jar: _controller.jars[index],
                              isSelected: _controller.selectedJarIndex == index,
                              onTap: () => _controller.selectJar(index),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
