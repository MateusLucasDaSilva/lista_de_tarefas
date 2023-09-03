import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_de_tarefas/app/src/di/injectable.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/home/controller/home_controller.dart';
import 'package:lista_de_tarefas/app/src/presentation/screens/home/widget/tarefa_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = getIt<HomeController>();

  @override
  void initState() {
    controller.getTasks();
    super.initState();
  }

  void goToEditTask(TaskEntity task) {
    Navigator.pushNamed(context, NamedRoutes.editTask.route,
        arguments: <String, dynamic>{
          'task': task,
          'callback': controller.updateTask
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                NamedRoutes.addTask.route,
                arguments: controller.postTask,
              );
            },
            icon: const Icon(Icons.add_task),
          ),
        ],
        title: Text(
          'Lista de Tarefas',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
      ),
      body: Observer(
        builder: (context) => Center(
          child: ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final TaskEntity task = controller.tasks[index];

              return TarefaWidget(
                tarefa: task,
                goToEditTask: goToEditTask,
              );
            },
          ),
        ),
      ),
    );
  }
}
