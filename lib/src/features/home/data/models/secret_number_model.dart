// Flutter imports:
import 'package:adivina_numero/src/features/home/data/enums/number_color.dart';

// Package imports:
import 'package:equatable/equatable.dart';

final class SecretNumberModel extends Equatable {
  /// Modelo de número secreto.
  /// - [number] número secreto.
  /// - [color] color del número secreto.
  const SecretNumberModel(
    this.number,
    this.color,
  );

  final int number;
  final NumberColor color;

  String get renderText => number.toString();

  @override
  List<Object?> get props => [
        number,
        color,
      ];
}
