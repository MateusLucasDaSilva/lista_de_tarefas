import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/pages/home/add_tarefa/add_tarefas.dart';
import 'package:lista_de_tarefas/app/pages/home/edit_tarefa/edit_tarefa.dart';
import 'package:lista_de_tarefas/app/pages/splash/splash_page.dart';
import 'package:lista_de_tarefas/app/repositories/tarefa/implements/tarefa_reporitory_impl.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_page.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => TarefaReporitoryImpl(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        title: 'Lista de Terefas',
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/add_tarefas': (context) => const AddTarefas(),
          '/edit_tarefa': (context) => const EditTarefa(),
        },
        home: const HomePage(),
      ),
    );
  }
}
