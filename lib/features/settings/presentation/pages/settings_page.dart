import 'package:alchemy_sort/features/game/state/progress_controller.dart';
import 'package:alchemy_sort/features/settings/state/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile.adaptive(
            value: settings.soundEnabled,
            onChanged: settings.toggleSound,
            title: const Text('Som'),
          ),
          SwitchListTile.adaptive(
            value: settings.musicEnabled,
            onChanged: settings.toggleMusic,
            title: const Text('Música'),
          ),
          SwitchListTile.adaptive(
            value: settings.vibrationEnabled,
            onChanged: settings.toggleVibration,
            title: const Text('Vibração'),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () async {
              await context.read<ProgressController>().reset();
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Progresso resetado.')),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Resetar progresso'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () async {
              await context.read<SettingsController>().reset();
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Configurações restauradas.')),
              );
            },
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restaurar configurações'),
          ),
        ],
      ),
    );
  }
}
