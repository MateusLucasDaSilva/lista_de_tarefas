import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lista_de_tarefas/app/src/data/models/task/task_model.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';

import '../tarefa_reporitory.dart';

class TarefaReporitoryImpl implements TarefaReporitory {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('tasks');
  @override
  Future<List<TaskEntity>> getAllTarefas() async {
    QuerySnapshot result = await _collection.get();
    return result.docs
        .map((doc) => TaskEntity(
              id: doc.reference.id,
              name: doc['name'],
              description: doc['description'],
              situation: doc['situation'],
            ))
        .toList();
  }

  @override
  Future<void> save(TaskEntity tarefa) async {
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
  Future<void> update(TaskEntity tarefa) {
    return _collection
        .doc(tarefa.id)
        .update(TaskModal.fromEntity(tarefa).toJson());
  }

  @override
  Future<void> delete(TaskEntity tarefa) async {
    await _collection.doc(tarefa.id).delete();
  }
}
