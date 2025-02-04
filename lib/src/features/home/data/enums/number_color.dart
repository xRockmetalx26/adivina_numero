import 'package:flutter/material.dart';

/// Colores del número.
enum NumberColor {
  red,
  green;

  Color get renderColor => switch (this) {
        NumberColor.red => Colors.red,
        NumberColor.green => Colors.green,
      };
}
