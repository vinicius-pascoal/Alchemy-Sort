import 'package:alchemy_sort/app/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B0717), Color(0xFF1A1132), Color(0xFF251248)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: -80,
                top: -80,
                child: _GlowOrb(
                  size: 220,
                  color: Colors.cyanAccent.withAlpha(35),
                ),
              ),
              Positioned(
                right: -70,
                bottom: -70,
                child: _GlowOrb(
                  size: 260,
                  color: Colors.orangeAccent.withAlpha(30),
                ),
              ),
              Center(
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
            ],
          ),
        ),
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
