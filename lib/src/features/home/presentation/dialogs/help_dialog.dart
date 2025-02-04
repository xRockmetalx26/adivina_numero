// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/shared/app_colors.dart';
import 'package:adivina_numero/src/shared/constant.dart';
import 'package:adivina_numero/src/shared/widgets/spaces.dart';

final class HelpDialog extends StatefulWidget {
  /// Muestra el cuadro de diálogo de ayuda.
  const HelpDialog({super.key});

  Future<bool?> show(BuildContext context) => showDialog(
        context: context,
        builder: (_) => this,
      );

  @override
  State<HelpDialog> createState() => _HelpDialogState();
}

final class _HelpDialogState<T extends Object> extends State<HelpDialog> {
  static const message = '''Solo se permiten números enteros
[0-9]

Fácil: 1-10
Medio: 1-20
Avanzado: 1-100
Extremo: 1-1000''';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: kDialogBorder,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info,
              color: AppColors.primary,
              size: 64,
            ),
            Spaces.height8,
            Text(
              message,
              textAlign: TextAlign.center,
              style: kBigStyle,
            ),
            Spaces.height16,
            // aceptar y cerrar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                fixedSize: const Size.fromHeight(kSmallButtonHeight),
                shape: const StadiumBorder(),
              ),
              onPressed: () async {
                if (mounted) Navigator.of(context).pop();
              },
              child: Text(
                'Aceptar',
                style: kBigStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
