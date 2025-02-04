// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:adivina_numero/src/core/app/flutter_cout.dart';
import 'package:adivina_numero/src/di/init_gi.dart';
import 'package:adivina_numero/src/features/home/data/models/secret_number_model.dart';
import 'package:adivina_numero/src/features/home/presentation/dialogs/help_dialog.dart';
import 'package:adivina_numero/src/features/home/presentation/providers/home_provider.dart';
import 'package:adivina_numero/src/features/home/widgets/drawable_number_column.dart';
import 'package:adivina_numero/src/features/home/widgets/home_app_bar.dart';
import 'package:adivina_numero/src/features/home/widgets/number_column.dart';
import 'package:adivina_numero/src/shared/app_colors.dart';
import 'package:adivina_numero/src/shared/constant.dart';
import 'package:adivina_numero/src/shared/dialogs/notification_dialog.dart';
import 'package:adivina_numero/src/shared/widgets/spaces.dart';

final class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const id = '/home';

  static Future<T?> pushNavigate<T extends Object?>(BuildContext context) {
    Cout.route(id);
    return Navigator.pushNamedAndRemoveUntil(context, id, (_) => false);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

final class _HomePageState extends State<HomePage> {
  // providers
  final _provider = gi<HomeProvider>()..initialize();

  // controllers
  final _textController = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.greyBackground,
        appBar: HomeAppBar(),
        body: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Selector<HomeProvider, int>(
                        selector: (_, provider) => provider.getNumberLength,
                        builder: (_, length, __) => TextFormField(
                          controller: _textController,
                          focusNode: _focus,
                          maxLength: _provider.getNumberLength,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: kBigStyle.copyWith(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Número',
                            hintText: '####',
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                          inputFormatters: [
                            TextInputFormatter.withFunction(_validateInput),
                          ],
                          onFieldSubmitted: _onTry,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Selector<HomeProvider, int>(
                        selector: (_, provider) => provider.tries,
                        builder: (_, tries, __) {
                          return Text(
                            'Intentos\n${tries.toString()}',
                            textAlign: TextAlign.center,
                            style: kBigStyle,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Spaces.height20,
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Selector<HomeProvider, List<int>>(
                        selector: (_, provider) => provider.olders.toList(),
                        builder: (_, olders, __) => NumberColumn(
                          title: 'Mayor que',
                          numbers: olders,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Selector<HomeProvider, List<int>>(
                        selector: (_, provider) => provider.minors.toList(),
                        builder: (_, minors, __) => NumberColumn(
                          title: 'Menor que',
                          numbers: minors,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Selector<HomeProvider, List<SecretNumberModel>>(
                        selector: (_, provider) => provider.historic.toList(),
                        builder: (_, historic, __) => DrawableNumberColumn(
                          title: 'Historial',
                          numbers: historic,
                        ),
                      ),
                    ),
                  ],
                ),
                Spaces.height32,
                Selector<HomeProvider, Difficult>(
                  selector: (_, provider) => provider.difficult,
                  builder: (_, difficult, __) => Column(
                    spacing: 5,
                    children: [
                      Text(
                        difficult.renderText,
                        style: kBigStyle,
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          allowedInteraction: SliderInteraction.slideOnly,
                          inactiveTickMarkColor: Colors.white,
                        ),
                        child: Slider(
                          inactiveColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: .50),
                          max: 3,
                          thumbColor: Colors.white,
                          secondaryActiveColor: Colors.white,
                          overlayColor: WidgetStatePropertyAll(Colors.white),
                          divisions: 3,
                          value: difficult.index.toDouble(),
                          onChanged: (value) {
                            final difficult = Difficult.values.firstWhere(
                              (difficult) => difficult.index == value.toInt(),
                            );
                            _provider.changeDifficult(difficult);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTry(String value) {
    if (value.isEmpty) {
      HelpDialog().show(context);
      return;
    }

    final number = int.tryParse(value);
    final isRepeated =
        _provider.minors.contains(number) || _provider.olders.contains(number);
    if (isRepeated) {
      NotificationDialog.dissmisible(
        iconData: Icons.info,
        message: 'Seleccione un número distinto de los anteriores',
      ).show(context);

      return;
    }

    _textController.clear();
    _provider.tryNumber(number!);
    _focus.requestFocus();
  }

  TextEditingValue _validateInput(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    if (newValue.text.startsWith('0')) {
      NotificationDialog.dissmisible(
        iconData: Icons.info,
        message: 'El primer dígito no puede ser 0',
      ).show(context);
      return oldValue;
    }

    final isNumber = RegExp(r'^[0-9]+$').hasMatch(newValue.text);
    if (!isNumber) {
      const HelpDialog().show(context);
      return oldValue;
    }

    final number = int.parse(newValue.text);
    final rangeIsValid = number <= _provider.getMax;
    if (!rangeIsValid) {
      const HelpDialog().show(context);
      return oldValue;
    }

    return newValue;
  }
}
