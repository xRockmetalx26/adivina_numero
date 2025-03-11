// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:adivina_numero/src/core/app/app_router.dart';
import 'package:adivina_numero/src/features/splash/presentation/pages/splash_page.dart';

final class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

final class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplashPage.id,
      onGenerateRoute: (settings) => AppRouter.router.matchRoute(
        settings.name!,
        routeSettings: settings,
      ),
    );
  }
}
