// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/features/home/data/models/secret_number_model.dart';
import 'package:adivina_numero/src/shared/constant.dart';
import 'package:adivina_numero/src/shared/widgets/spaces.dart';

final class DrawableNumberColumn extends StatefulWidget {
  /// Columna de números de color rojo o negro.
/// - [title] título de la columna.
/// - [numbers] lista de números a renderizar.
  const DrawableNumberColumn({
    super.key,
    required this.title,
    required this.numbers,
  });

  final String title;
  final List<SecretNumberModel> numbers;

  @override
  State<DrawableNumberColumn> createState() => _DrawableNumberColumnState();
}

class _DrawableNumberColumnState extends State<DrawableNumberColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .30,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: kNormalStyle,
          ),
          Spaces.height8,
          Expanded(
            child: ListView.separated(
              itemCount: widget.numbers.length,
              separatorBuilder: (_, __) => Spaces.height4,
              itemBuilder: (_, index) {
                final secretNumber = widget.numbers[index];
                return Text(
                  secretNumber.renderText,
                  textAlign: TextAlign.center,
                  style: k20Style.copyWith(color: secretNumber.color.renderColor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
