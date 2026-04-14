import 'package:alchemy_sort/features/game/domain/entities/level.dart';
import 'package:alchemy_sort/features/game/presentation/pages/game_page.dart';
import 'package:alchemy_sort/features/home/presentation/pages/home_page.dart';
import 'package:alchemy_sort/features/levels/presentation/pages/levels_page.dart';
import 'package:alchemy_sort/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const levels = '/levels';
  static const game = '/game';
  static const settings = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute<void>(builder: (_) => const HomePage());
      case levels:
        return MaterialPageRoute<void>(builder: (_) => const LevelsPage());
      case game:
        final level = routeSettings.arguments as Level;
        return MaterialPageRoute<void>(builder: (_) => GamePage(level: level));
      case settings:
        return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute<void>(builder: (_) => const HomePage());
    }
  }
}
