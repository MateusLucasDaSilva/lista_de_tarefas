import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/pages/home/add_tarefa/add_tarefas.dart';
import 'package:lista_de_tarefas/app/pages/home/edit_tarefa/edit_tarefa.dart';
import 'package:lista_de_tarefas/app/pages/splash/splash_page.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/home/home_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes =
    <String, Widget Function(BuildContext)>{
  NamedRoutes.splash.route: (BuildContext context) => const SplashPage(),
  NamedRoutes.home.route: (BuildContext context) => const HomePage(),
  NamedRoutes.addTask.route: (context) => const AddTarefas(),
  NamedRoutes.editTask.route: (context) => const EditTarefa(),
};
