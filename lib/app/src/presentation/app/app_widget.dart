import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/theme/app_theme.dart';
import 'package:lista_de_tarefas/app/src/presentation/app/widgets/app_toast.dart';

import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      alignment: Alignment.topLeft,
      children: [
        MaterialApp(
          title: 'TODO LIST',
          scaffoldMessengerKey: _scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: AppThemes().defaultTheme,
          initialRoute: NamedRoutes.splash.route,
          routes: appRoutes,
        ),
        Positioned(
          top: 0,
          child: AppToast(
            secondsDuration: 4,
            scaffoldMessengerKey: _scaffoldMessengerKey,
          ),
        ),
      ],
    );
  }
}
