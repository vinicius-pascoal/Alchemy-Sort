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
        Image.asset(
          'assets/imgs/fundo.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xBF07040F), Color(0xC20F0A1D), Color(0xC71A1031)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0x33FFFFFF), width: 2),
              left: BorderSide(color: Color(0x33FFFFFF), width: 2),
              right: BorderSide(color: Color(0x33000000), width: 2),
              bottom: BorderSide(color: Color(0x33000000), width: 2),
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
