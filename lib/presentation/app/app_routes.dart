import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/presentation/screens/home/home_screen.dart';
import 'package:lista_de_tarefas/presentation/screens/home/screens/add_tarefa/add_tarefas.dart';
import 'package:lista_de_tarefas/presentation/screens/home/screens/edit_tarefa/edit_tarefa.dart';
import 'package:lista_de_tarefas/presentation/screens/splash/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, Widget Function(BuildContext)>{
    NamedRoutes.splash.route: (BuildContext context) => const SplashPage(),
    NamedRoutes.home.route: (BuildContext context) => const HomePage(),
    NamedRoutes.addTask.route: (BuildContext context) => const AddTarefas(),
    NamedRoutes.editTask.route: (BuildContext context) => const EditTarefa(),
  };
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
