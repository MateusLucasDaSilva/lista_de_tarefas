import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/home/home_screen.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/home/screens/add_tarefa/add_tarefas.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/home/screens/edit_tarefa/edit_tarefa.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/splash/splase_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes =
    <String, Widget Function(BuildContext)>{
  NamedRoutes.splash.route: (BuildContext context) => const SplashPage(),
  NamedRoutes.home.route: (BuildContext context) => const HomePage(),
  NamedRoutes.addTask.route: (BuildContext context) => const AddTarefas(),
  NamedRoutes.editTask.route: (BuildContext context) => const EditTarefa(),
};
