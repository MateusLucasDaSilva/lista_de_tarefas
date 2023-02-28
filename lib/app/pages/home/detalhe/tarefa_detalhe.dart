import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

class TarefaDetalhe extends StatelessWidget {
  final TarefaModel tarefa;

  const TarefaDetalhe({super.key, required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          tarefa.name,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/edit_tarefa', arguments: tarefa);
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text('Deseja excluir a tarefa ${tarefa.name}'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Não'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Sim'),
                          ),
                        ],
                      ),

                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chip(label: Text(tarefa.description)),
            Chip(label: Text(tarefa.situation)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'))
          ],
        ),
      ),
    );
  }
}
