// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

final class Cout {
  const Cout._();

  static const String _reset = '\x1B[0m';

  /// Usado para mostrar [info] de [data].
  static void info(dynamic data) {
    if (kDebugMode) log('${TextColor.brightPurple}[info] $data$_reset');
  }

  /// Usado para mostrar [route] de [id].
  static void route(dynamic id) {
    if (kDebugMode) log('${TextColor.white}[route] $id$_reset');
  }

  /// Usado para mostrar [success] de [data].
  static void success(dynamic data) {
    if (kDebugMode) log('${TextColor.brightGreen}[success] $data$_reset');
  }

  /// Usado para mostrar [warning] de [data].
  static void warning(dynamic data) {
    if (kDebugMode) log('${TextColor.brightYellow}[warning] $data$_reset');
  }

  /// Usado para mostrar [error] de [data].
  static void error(dynamic data) {
    if (kDebugMode) log('${TextColor.brightRed}[error] $data$_reset');
  }

  /// Usado para mostrar mensajes [custom] de [data].
  static void custom(
    dynamic data, {
    String? backgroundColor,
    String? frontColor,
  }) {
    if (kDebugMode) {
      log(
        '${backgroundColor ?? _reset}${frontColor ?? _reset}[custom] $data$_reset',
      );
    }
  }
}

final class BackgroundColor {
  static const String black = '\x1B[40m';
  static const String red = '\x1B[41m';
  static const String green = '\x1B[42m';
  static const String yellow = '\x1B[43m';
  static const String blue = '\x1B[44m';
  static const String purple = '\x1B[45m';
  static const String cyan = '\x1B[46m';
  static const String white = '\x1B[47m';

  static const String brightBlack = '\x1B[40;1m';
  static const String brightRed = '\x1B[41;1m';
  static const String brightGreen = '\x1B[42;1m';
  static const String brightYellow = '\x1B[43;1m';
  static const String brightBlue = '\x1B[44;1m';
  static const String brightPurple = '\x1B[45;1m';
  static const String brightCyan = '\x1B[46;1m';
  static const String brightWhite = '\x1B[47;1m';
}

final class TextColor {
  static const String black = '\x1B[30m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String purple = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';

  static const String brightBlack = '\x1B[30;1m';
  static const String brightRed = '\x1B[31;1m';
  static const String brightGreen = '\x1B[32;1m';
  static const String brightYellow = '\x1B[33;1m';
  static const String brightBlue = '\x1B[34;1m';
  static const String brightPurple = '\x1B[35;1m';
  static const String brightCyan = '\x1B[36;1m';
  static const String brightWhite = '\x1B[37;1m';
}
