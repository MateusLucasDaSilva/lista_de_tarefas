import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/app_global/app_global.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/failure/failure.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';

class TarefaWidget extends StatelessWidget {
  final TaskEntity tarefa;
  const TarefaWidget({Key? key, required this.tarefa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => TarefaDetalhe(
            //       tarefa: tarefa,
            //     ),
            //   ),
            // );
            AppGlobal.instance.streamError
                .add(GetTasksFailure(message: 'Ocorreu um erro !'));
          },
          leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/2721/2721299.png')),
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
