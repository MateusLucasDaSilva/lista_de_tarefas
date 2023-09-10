import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';

import '../../../../domain/constants/app_sizes.dart';

class TarefaWidget extends StatelessWidget {
  final TaskEntity tarefa;
  final Function(TaskEntity) goToEditTask;
  const TarefaWidget({
    super.key,
    required this.tarefa,
    required this.goToEditTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.shadow.withOpacity(.5),
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: ListTile(
              onTap: () => goToEditTask(tarefa),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/2721/2721299.png'),
              ),
              title: Text('# ${tarefa.name}'),
              subtitle: Text(tarefa.description),
              trailing: Text(
                  '${tarefa.dateTime.hour}/${tarefa.dateTime.day}/${tarefa.dateTime.year}'),
              isThreeLine: true,
              dense: false,
            ),
          ),
        ),
      ),
    );
  }
}
