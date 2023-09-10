import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_de_tarefas/core/services/local_notification/local_notification_service.dart';
import 'package:lista_de_tarefas/di/injectable.dart';
import 'package:lista_de_tarefas/domain/constants/app_images.dart';
import 'package:lista_de_tarefas/domain/entities/notification/notification_entity.dart';
import 'package:lista_de_tarefas/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/presentation/screens/home/controller/home_controller.dart';
import 'package:lista_de_tarefas/presentation/screens/home/widget/tarefa_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = getIt<HomeController>();
  final LocalNotificationService notificationController =
      getIt<LocalNotificationService>();

  @override
  void initState() {
    controller.getTasks();
    notificationController.checkNotification();
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        notificationController.showNotification(
          NotificationEntity(
            id: 1,
            title: 'Hora de adicionar uma nova tarefa!',
            body:
                'adicione uma tarefa para deixar o seu dia mais produtivo e fça com que você se organize melhor!',
            payload: 'route/',
          ),
        );
      }),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.paisagem,
            ),
          ),
        ),
        child: Observer(
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
      ),
    );
  }
}
