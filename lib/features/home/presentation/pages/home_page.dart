import 'package:alchemy_sort/app/routes.dart';
import 'package:alchemy_sort/core/widgets/arcane_background.dart';
import 'package:flutter/material.dart';

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
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xB21A1330),
                  border: Border.all(color: const Color(0x99FFFFFF), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xAA05030E),
                      blurRadius: 0,
                      spreadRadius: 3,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Alchemy Sort',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
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
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: Colors.white.withAlpha(225),
                      ),
                    ),
                    const SizedBox(height: 38),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.levels),
                      child: const Text('Jogar'),
                    ),
                    const SizedBox(height: 14),
                    OutlinedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.levels),
                      child: const Text('Fases'),
                    ),
                    const SizedBox(height: 14),
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
