// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:adivina_numero/src/shared/app_colors.dart';

/// Gestiona las rutas del app.
final class AppRouter {
  AppRouter._();

  static final _router = AppRouter._();
  static AppRouter get router => _router;

  // Conjunto de `AppRoute` agregadas al `AppRouter`.
  final _routes = <AppRoute>{};

  /// Configuración de la `Route` actual.
  RouteSettings? currentRoute;

  /// Operador usado para agregar una [appRoute] al AppRouter.
  AppRouter operator +(AppRoute appRoute) {
    if (_routes.contains(appRoute)) {
      throw Exception('Route ${appRoute.id} duplicated.');
    }

    _routes.add(appRoute);
    return this;
  }

  /// Retorna una `Route` asociada con [id] con los [routeSettings].
  /// si no la encuentra, retornara una `Route` por defecto.
  /// - [id] id de la ruta.
  /// - [routeSettings] configuración de la ruta.
  Route matchRoute(
    String id, {
    RouteSettings? routeSettings,
  }) {
    final routeMatched = _routes.firstWhereOrNull((route) => route.id == id);

    if (routeMatched is AppRoute) {
      currentRoute = routeSettings;

      return MaterialPageRoute(
        settings: RouteSettings(
          name: id,
          arguments: routeSettings!.arguments,
        ),
        builder: (_) => routeMatched.builder(routeSettings.arguments),
      );
    }

    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              size: 64,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ruta no implementada, debes agregar esta ruta en el AppRouter al inicializar tu módulo.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class AppRoute extends Equatable {
  /// Contiene la información de la ruta del app.
  /// - [id] id de la ruta.
  /// - [builder] builder de la Ruta.
  const AppRoute({
    required this.id,
    required this.builder,
  });

  final String id;
  final Widget Function(dynamic args) builder;

  @override
  List<Object?> get props => [id];
}
