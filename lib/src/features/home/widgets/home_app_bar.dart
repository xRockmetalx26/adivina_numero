// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:adivina_numero/src/features/home/presentation/dialogs/help_dialog.dart';
import 'package:adivina_numero/src/shared/app_colors.dart';

final class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: preferredSize.height,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text('Adivina el número'),
        actions: [
          IconButton(
            onPressed: () => HelpDialog().show(context),
            icon: Icon(
              Icons.menu,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
