// Project imports:
import 'package:adivina_numero/src/core/app/app_router.dart';
import 'package:adivina_numero/src/features/splash/presentation/pages/splash_page.dart';

void initSplashModule() {
  // routes
  AppRouter.router +
      AppRoute(
        id: SplashPage.id,
        builder: (_) => const SplashPage(),
      );
}
