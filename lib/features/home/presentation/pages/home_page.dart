import 'package:alchemy_sort/app/routes.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
import 'package:alchemy_sort/core/widgets/pixel_frame_panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArcaneBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: PixelFramePanel(
                frame: PixelFrame.dark,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 32,
                ),
                constraints: const BoxConstraints(maxWidth: 320),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Título do jogo
                    const Text(
                      'Alchemy\nSort',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Subtítulo / Descrição
                    const Text(
                      'Organize as poções mágicas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.6,
                        color: Color(0xFFBBBBBB),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Botão Jogar
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.levels);
                      },
                      child: const Text('JOGAR'),
                    ),
                    const SizedBox(height: 12),

                    // Botão Configurações
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.settings);
                      },
                      child: const Text('CONFIGURAÇÕES'),
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
