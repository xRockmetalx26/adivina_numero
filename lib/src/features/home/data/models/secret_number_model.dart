// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';

final class SecretNumberModel extends Equatable {
  const SecretNumberModel(
    this.number,
    this.color,
  );

  final int number;
  final NumberColor color;

  String get renderText => number.toString();

  Color get renderColor => switch (color) {
        NumberColor.red => Colors.red,
        NumberColor.green => Colors.green,
      };

  @override
  List<Object?> get props => [
        number,
        color,
      ];
}

enum NumberColor {
  red,
  green,
}
