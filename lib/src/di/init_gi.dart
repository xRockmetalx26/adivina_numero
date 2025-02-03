// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:adivina_numero/src/di/init_modules.dart';

final gi = GetIt.instance;

/// `registerLazySingleton` Para registrar instancias únicas, se crean cuando se llaman por primera vez.
///
/// `registerSingleton` Para registrar instancias únicas, se crean inmediatamente.
///
/// `registerFactory` Puede crear varias instancias.
Future<void> initGi() async {
  // inicialización de módulos del app
  initModules();
}
