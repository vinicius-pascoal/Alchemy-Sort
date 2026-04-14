import 'package:alchemy_sort/app/routes.dart';
import 'package:alchemy_sort/core/theme/app_theme.dart';
import 'package:alchemy_sort/features/game/state/progress_controller.dart';
import 'package:alchemy_sort/features/settings/state/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProgressController>(
          create: (_) => ProgressController()..load(),
        ),
        ChangeNotifierProvider<SettingsController>(
          create: (_) => SettingsController()..load(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alchemy Sort',
        theme: AppTheme.build(),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
