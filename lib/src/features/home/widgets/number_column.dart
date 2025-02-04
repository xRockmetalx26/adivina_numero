// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/shared/constant.dart';
import 'package:adivina_numero/src/shared/widgets/spaces.dart';

/// Columna de numeros.
/// - [title] título de la columna.
/// - [numbers] lista de números a renderizar.
final class NumberColumn extends StatelessWidget {
  const NumberColumn({
    super.key,
    required this.title,
    required this.numbers,
  });

  final String title;
  final List<int> numbers;

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
            title,
            style: kNormalStyle,
          ),
          Spaces.height8,
          Expanded(
            child: ListView.separated(
              itemCount: numbers.length,
              separatorBuilder: (_, __) => Spaces.height4,
              itemBuilder: (_, index) => Text(
                numbers[index].toString(),
                textAlign: TextAlign.center,
                style: k20Style,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
