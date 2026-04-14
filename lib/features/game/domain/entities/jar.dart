import 'package:flutter/material.dart';

enum PotionType { amethyst, sapphire, emerald, amber, ruby, cyan, silver }

extension PotionTypeColor on PotionType {
  Color get color {
    switch (this) {
      case PotionType.amethyst:
        return const Color(0xFF8F6AF7);
      case PotionType.sapphire:
        return const Color(0xFF4DA3FF);
      case PotionType.emerald:
        return const Color(0xFF42D392);
      case PotionType.amber:
        return const Color(0xFFF6B35E);
      case PotionType.ruby:
        return const Color(0xFFF56A8A);
      case PotionType.cyan:
        return const Color(0xFF61DFF3);
      case PotionType.silver:
        return const Color(0xFFDAE3EE);
    }
  }
}

class Jar {
  Jar({required this.capacity, required List<PotionType> layers})
    : layers = List<PotionType>.from(layers);

  final int capacity;
  final List<PotionType> layers;

  bool get isEmpty => layers.isEmpty;
  bool get isFull => layers.length >= capacity;
  PotionType? get top => isEmpty ? null : layers.last;

  bool get isUniform {
    if (isEmpty) {
      return true;
    }
    return layers.every((potion) => potion == layers.first);
  }

  Jar copy() => Jar(capacity: capacity, layers: layers);
}
