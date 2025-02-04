// Flutter imports:
import 'package:flutter/widgets.dart';

/// Realiza un efecto `FadeTwen` en un `Widget` segun su `Duration`.
/// - [repeat] si es necesario repetir el efecto en caso de build,
/// - [duration] duración del efecto,
/// - [child] widget al cual se le aplicar el efecto.
final class FadeTwenV2 extends StatefulWidget {
  const FadeTwenV2({
    super.key,
    required this.child,
    this.repeat = false,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final bool repeat;
  final Duration duration;

  /// Lo mismo que `FadeTwenV2()`, pero con:
  /// - [repeat] = `false`
  const FadeTwenV2.repeat({
    super.key,
    required this.child,
    this.repeat = true,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<FadeTwenV2> createState() => _FadeTwenV2State();
}

final class _FadeTwenV2State extends State<FadeTwenV2>
    with SingleTickerProviderStateMixin {
  // controllers
  late final _controller =
      AnimationController(vsync: this, duration: widget.duration);

  // core
  late final _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.repeat) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.repeat) {
      _controller
        ..reset()
        ..forward();
    }

    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
