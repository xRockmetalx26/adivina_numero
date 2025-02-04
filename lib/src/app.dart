// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:adivina_numero/src/core/app/app_router.dart';
import 'package:adivina_numero/src/di/init_gi.dart';
import 'package:adivina_numero/src/features/home/presentation/providers/home_provider.dart';
import 'package:adivina_numero/src/features/splash/presentation/pages/splash_page.dart';

final class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

final class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // asignamos el provider del home con .value, puesto que es un L value
        ChangeNotifierProvider.value(value: gi<HomeProvider>()),
      ],
      child: MaterialApp(
        initialRoute: SplashPage.id,
        onGenerateRoute: (settings) => AppRouter.router.matchRoute(
          settings.name!,
          routeSettings: settings,
        ),
      ),
    );
  }
}
