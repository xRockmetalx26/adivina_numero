/// Dificultades del juego.
enum Difficult {
  easy,
  mid,
  advanced,
  extreme;

  String get renderText => switch (this) {
        easy => 'Fácil',
        mid => 'Medio',
        advanced => 'Avanzado',
        extreme => 'Extremo',
      };
}
