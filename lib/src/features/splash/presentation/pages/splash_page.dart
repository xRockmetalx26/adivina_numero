// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/core/app/flutter_cout.dart';
import 'package:adivina_numero/src/features/home/presentation/pages/home_page.dart';
import 'package:adivina_numero/src/shared/app_colors.dart';
import 'package:adivina_numero/src/shared/widgets/fade_transition_v2.dart';

final class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const id = '/splash';

  static Future<T?> pushNavigate<T extends Object?>(BuildContext context) {
    Cout.route(id);
    return Navigator.pushNamed(context, id);
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

final class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // despues del primer frame, esperamos 2 segundos para ir al home
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        Duration(seconds: 2),
        () {
          if (mounted) HomePage.pushNavigate(context);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.primary,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Test de adivina el número',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            // fade en la imagen del splash
            FadeTwenV2(
              duration: const Duration(seconds: 2),
              child: Image.asset('assets/images/icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
