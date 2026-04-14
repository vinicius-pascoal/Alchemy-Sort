import 'package:alchemy_sort/features/game/state/progress_controller.dart';
import 'package:alchemy_sort/core/widgets/pixel_frame_panel.dart';
import 'package:alchemy_sort/features/settings/state/settings_controller.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ArcaneBackground(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: PixelFramePanel(
              frame: PixelFrame.dark,
              margin: const EdgeInsets.all(16),
              constraints: const BoxConstraints(minWidth: 360, minHeight: 460),
              padding: const EdgeInsets.all(5),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        value: settings.soundEnabled,
                        onChanged: settings.toggleSound,
                        title: const Text(
                          'Som',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        value: settings.musicEnabled,
                        onChanged: settings.toggleMusic,
                        title: const Text(
                          'Música',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        value: settings.vibrationEnabled,
                        onChanged: settings.toggleVibration,
                        title: const Text(
                          'Vibração',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  PixelFramePanel(
                    frame: PixelFrame.warning,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            await context.read<ProgressController>().reset();
                            if (!context.mounted) {
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Progresso resetado.'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.refresh, size: 18),
                          label: const Text(
                            'Resetar progresso',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await context.read<SettingsController>().reset();
                            if (!context.mounted) {
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Configurações restauradas.'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.restart_alt, size: 18),
                          label: const Text(
                            'Restaurar configurações',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
