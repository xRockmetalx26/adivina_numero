// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:adivina_numero/src/features/home/data/enums/difficult.dart';
import 'package:adivina_numero/src/features/home/data/enums/number_color.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/core/app/flutter_cout.dart';
import 'package:adivina_numero/src/features/home/data/models/secret_number_model.dart';

final class HomeProvider extends ChangeNotifier {
  // core
  final random = Random();
  final minors = <int>[];
  final olders = <int>[];
  final historic = <SecretNumberModel>[];

  late Difficult difficult;
  late int secretNumber;
  late int tries;

  /// Inicializa el provider cuando se entra a la página de home.
  void initialize() {
    difficult = Difficult.easy;
    secretNumber = random.nextInt(10) + 1;
    tries = 5;

    minors.clear();
    olders.clear();
    historic.clear();
  }

  /// Resetea los valores del provider, de acuerdo a la dificultad.
  void clear() {
    secretNumber = getSecretNumber;
    tries = getTries;

    minors.clear();
    olders.clear();
    notifyListeners();

    Cout.info([
      difficult,
      secretNumber,
      tries,
    ]);
  }

  /// Cambia la dificultad.
  void changeDifficult(Difficult difficult) {
    this.difficult = difficult;

    clear();
    notifyListeners();
  }

  /// Realiza el intento de adivinar el número ingresado.
  /// - [number] número para comparar con el número secreto.
  void tryNumber(int number) {
    tries--;

    // si adivina el número
    if (number == secretNumber) {
      historic.add(SecretNumberModel(secretNumber, NumberColor.green));
      clear();
    }
    // si pierde por intentos
    else if (tries == 0) {
      historic.add(SecretNumberModel(secretNumber, NumberColor.red));
      clear();
    }
    // si el numero es menor que el secreto
    else if (number < secretNumber) {
      olders.add(number);
    }
    // si el numero es mayor que el secreto
    else {
      minors.add(number);
    }

    notifyListeners();
  }

  /// Genera un número secreto según la dificultad.
  int get getSecretNumber => switch (difficult) {
        Difficult.easy => random.nextInt(10) + 1,
        Difficult.mid => random.nextInt(20) + 1,
        Difficult.advanced => random.nextInt(100) + 1,
        Difficult.extreme => random.nextInt(1000) + 1,
      };

  /// Obtiene la cantidad de dígitos según la dificultad.
  int get getNumberLength => switch (difficult) {
        Difficult.easy => 2,
        Difficult.mid => 2,
        Difficult.advanced => 3,
        Difficult.extreme => 4,
      };

  /// Obtiene el número de intentos según la dificultad.
  int get getTries => switch (difficult) {
        Difficult.easy => 5,
        Difficult.mid => 8,
        Difficult.advanced => 15,
        Difficult.extreme => 25,
      };

  /// Obtiene el número maximo según la dificultad.
  int get getMax => switch (difficult) {
        Difficult.easy => 10,
        Difficult.mid => 20,
        Difficult.advanced => 100,
        Difficult.extreme => 1000,
      };
}
