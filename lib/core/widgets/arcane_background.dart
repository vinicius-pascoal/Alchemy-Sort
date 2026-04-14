import 'package:flutter/material.dart';

class ArcaneBackground extends StatelessWidget {
  const ArcaneBackground({
    super.key,
    required this.child,
    this.showGlow = true,
  });

  final Widget child;
  final bool showGlow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/imgs/fundo.png', fit: BoxFit.cover),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xAA080510), Color(0xAA120C24), Color(0xAA160E2F)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        if (showGlow)
          Positioned(
            left: -90,
            top: -90,
            child: _GlowOrb(size: 240, color: Colors.cyanAccent.withAlpha(30)),
          ),
        if (showGlow)
          Positioned(
            right: -80,
            bottom: -80,
            child: _GlowOrb(
              size: 280,
              color: Colors.orangeAccent.withAlpha(24),
            ),
          ),
        child,
      ],
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
