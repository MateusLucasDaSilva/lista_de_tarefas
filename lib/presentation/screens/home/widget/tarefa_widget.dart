import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';

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
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          onTap: () => goToEditTask(tarefa),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/2721/2721299.png'),
          ),
          title: Text('# ${tarefa.name}'),
          subtitle: Text(tarefa.description),
          trailing: Text(tarefa.situation),
          isThreeLine: true,
          dense: false,
        ),
      ),
    );
  }
}
