// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:adivina_numero/src/core/app/app_router.dart';
import 'package:adivina_numero/src/features/home/presentation/pages/home_page.dart';
import 'package:adivina_numero/src/features/home/presentation/providers/home_provider.dart';

void initHomeModule() {
  // routes
  AppRouter.router +
      AppRoute(
        id: HomePage.id,
        builder: (_) => const HomePage(),
      );

  // providers
  final gi = GetIt.instance;

  gi.registerLazySingleton(() => HomeProvider());
}
