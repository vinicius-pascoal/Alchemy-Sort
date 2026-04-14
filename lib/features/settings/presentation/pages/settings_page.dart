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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 580),
                child: PixelFramePanel(
                  frame: PixelFrame.dark,
                  margin: const EdgeInsets.all(16),
                  constraints: const BoxConstraints(minWidth: 320),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.tune_rounded, color: Color(0xFFFFC76B)),
                          SizedBox(width: 8),
                          Text(
                            'Painel de Configuracoes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Ajuste a experiencia do laboratorio para o seu estilo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withAlpha(210),
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 14),
                      PixelFramePanel(
                        frame: PixelFrame.highlighted,
                        padding: const EdgeInsets.all(20),
                        backgroundColor: const Color(0x77100C1C),
                        child: Column(
                          children: [
                            _SettingToggleRow(
                              icon: Icons.volume_up_rounded,
                              label: 'Som',
                              description: 'Efeitos ao mover e concluir fases',
                              value: settings.soundEnabled,
                              onChanged: settings.toggleSound,
                            ),
                            const SizedBox(height: 8),
                            _SettingToggleRow(
                              icon: Icons.music_note_rounded,
                              label: 'Musica',
                              description: 'Trilha ambiente do laboratorio',
                              value: settings.musicEnabled,
                              onChanged: settings.toggleMusic,
                            ),
                            const SizedBox(height: 8),
                            _SettingToggleRow(
                              icon: Icons.vibration_rounded,
                              label: 'Vibracao',
                              description: 'Feedback tatil nas interacoes',
                              value: settings.vibrationEnabled,
                              onChanged: settings.toggleVibration,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      PixelFramePanel(
                        frame: PixelFrame.warning,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.warning_amber_rounded, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  'Zona de Risco',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 13,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  await context
                                      .read<ProgressController>()
                                      .reset();
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
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  await context
                                      .read<SettingsController>()
                                      .reset();
                                  if (!context.mounted) {
                                    return;
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Configurações restauradas.',
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.restart_alt, size: 18),
                                label: const Text(
                                  'Restaurar configurações',
                                  style: TextStyle(fontSize: 12),
                                ),
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
        ),
      ),
    );
  }
}

class _SettingToggleRow extends StatelessWidget {
  const _SettingToggleRow({
    required this.icon,
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x33130D22),
        border: Border.all(color: const Color(0x44FFFFFF), width: 1.1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFFFFC76B)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withAlpha(190),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Switch.adaptive(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
