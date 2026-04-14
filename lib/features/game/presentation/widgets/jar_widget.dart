import 'package:alchemy_sort/features/game/domain/entities/jar.dart';
import 'package:flutter/material.dart';

class JarWidget extends StatelessWidget {
  const JarWidget({
    super.key,
    required this.jar,
    required this.isSelected,
    required this.onTap,
  });

  final Jar jar;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const width = 74.0;
    const height = 188.0;
    const padding = 8.0;
    final layerHeight = (height - (padding * 2)) / jar.capacity;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFF5BE65)
                : const Color(0xAAFFFFFF),
            width: isSelected ? 3 : 2,
          ),
          gradient: LinearGradient(
            colors: [Colors.white.withAlpha(26), Colors.white.withAlpha(10)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: const Color(0xFFF5BE65).withAlpha(60),
                blurRadius: 0,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            children: [
              for (var i = 0; i < jar.layers.length; i++)
                Positioned(
                  left: 2,
                  right: 2,
                  bottom: i * layerHeight,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: layerHeight - 2,
                      decoration: BoxDecoration(
                        color: jar.layers[i].color,
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(
                          color: Colors.black.withAlpha(85),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: jar.layers[i].color.withAlpha(120),
                            blurRadius: 0,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
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
