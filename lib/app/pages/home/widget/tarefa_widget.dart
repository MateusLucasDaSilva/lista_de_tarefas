import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

import '../detalhe/tarefa_detalhe.dart';

class TarefaWidget extends StatelessWidget {
  final TarefaModel tarefa;
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TarefaDetalhe(
                          tarefa: tarefa,
                        )));
          },
          leading: const CircleAvatar(backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/2721/2721299.png')),
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
