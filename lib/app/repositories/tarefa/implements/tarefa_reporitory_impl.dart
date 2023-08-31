import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

import '../tarefa_reporitory.dart';

class TarefaReporitoryImpl implements TarefaReporitory {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('tasks');
  @override
  Future<List<TarefaModel>> getAllTarefas() async {
    QuerySnapshot result = await _collection.get();
    return result.docs
        .map((doc) => TarefaModel(
              id: doc.reference.id,
              name: doc['name'],
              description: doc['description'],
              situation: doc['situation'],
            ))
        .toList();
  }

  @override
  Future<void> save(TarefaModel tarefa) async {
    try {
      Map<String, dynamic> mapa = {
        'name': tarefa.name,
        'description': tarefa.description,
        'situation': tarefa.situation
      };

      await _collection.add(mapa);
      log('Dados salvos com sucesso');
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      log('Erro ao salvar');
    }
  }

  @override
  Future<void> update(TarefaModel tarefa) {
    return _collection.doc(tarefa.id).update(tarefa.toMap());
  }

  @override
  Future<void> delete(TarefaModel tarefa) async {
    await _collection.doc(tarefa.id).delete();
  }
}
