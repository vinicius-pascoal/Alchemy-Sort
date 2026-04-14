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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Alchemy Sort',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ordene os elixires e domine o laboratório arcano',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withAlpha(210),
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
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(180, 52),
                      side: const BorderSide(color: Color(0xFFF5BE65)),
                      foregroundColor: const Color(0xFFF5BE65),
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('Fases'),
                  ),
                  const SizedBox(height: 14),
                  TextButton.icon(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.settings),
                    icon: const Icon(Icons.settings),
                    label: const Text('Configurações'),
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
