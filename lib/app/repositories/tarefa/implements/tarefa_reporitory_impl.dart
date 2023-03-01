import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

import '../tarefa_reporitory.dart';

class TarefaReporitoryImpl implements TarefaReporitory {
  @override
  Future<List<TarefaModel>> getAllTarefas() async {
    return [];
  }

  @override
  Future<TarefaModel> getTarefa(String id) async {
    return TarefaModel(
      name: 'name',
      description: 'description',
      situation: 'situation',
    );
  }

  @override
  Future<void> save(TarefaModel tarefa) async {
    try {
      CollectionReference colecao =
          FirebaseFirestore.instance.collection('tasks');

          var mapa = tarefa.toMap();
      await colecao.add(mapa);
      log('Dados salvos com sucesso');
    } on Exception catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
    }
  }
}
