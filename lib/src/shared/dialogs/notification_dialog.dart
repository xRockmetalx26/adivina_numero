// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/shared/app_colors.dart';
import 'package:adivina_numero/src/shared/constant.dart';
import 'package:adivina_numero/src/shared/widgets/spaces.dart';

final class NotificationDialog extends StatefulWidget {
  /// Diálogo para mostrar notificaciones, con un botón de aceptar.
  /// - [iconData] icono para renderizar en el diálogo.
  /// - [message] mensaje a renderizar.
  /// - [onPressed] función a realizar al aceptar.
  /// - [child] widget hijo para renderizar.
  /// - [primaryColor] color primario del diálogo.
  /// - [autoPop] si es requerido cerrar el diálogo al presionar aceptar.
  /// - [canPop] si es requerido cerrar el diálogo al presionar el `Pop`.
  /// - [dismissible] si es requerido cerrar el diálogo al presionar fuera.
  const NotificationDialog({
    super.key,
    required this.iconData,
    this.message,
    this.child,
    this.onPressed,
    this.primaryColor = AppColors.primary,
    this.autoPop = false,
    this.canPop = false,
    this.dismissible = false,
  }) : assert(
          (message == null && child is Widget) ||
              (message is String && child == null),
          'You can only use the message or child parameter, not both.',
        );

  final IconData iconData;
  final String? message;
  final Widget? child;
  final Future<bool> Function()? onPressed;
  final Color primaryColor;
  final bool autoPop;
  final bool canPop;
  final bool dismissible;

  /// Lo mismo que `NotificationDialog()` pero con:
  /// - [autoPop] = true.
  /// - [canPop] = true.
  /// - [dismissible] = true.
  const NotificationDialog.dissmisible({
    super.key,
    required this.iconData,
    this.message,
    this.child,
    this.onPressed,
    this.primaryColor = AppColors.primary,
  })  : autoPop = true,
        canPop = true,
        dismissible = true,
        assert(
          (message == null && child is Widget) ||
              (message is String && child == null),
          'You can only use the message or child parameter, not both.',
        );

  Future<bool?> show(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (_) => this,
      );

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

final class _NotificationDialogState<T extends Object>
    extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: kDialogBorder,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.iconData,
                color: widget.primaryColor,
                size: 64,
              ),
              Spaces.height8,
              widget.message is String
                  ? Text(
                      widget.message!,
                      textAlign: TextAlign.center,
                      style: kBigStyle,
                    )
                  : widget.child!,
              Spaces.height16,
              // aceptar y cerrar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size.fromHeight(kSmallButtonHeight),
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  final success = await widget.onPressed?.call();
                  if (widget.autoPop && mounted && context.mounted) {
                    Navigator.of(context).pop(success);
                  }
                },
                child: Text(
                  'Aceptar',
                  style: kBigStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
