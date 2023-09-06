import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/data/data_sources/task/task_datasource.dart';
import 'package:lista_de_tarefas/data/models/task/task_model.dart';
import 'package:lista_de_tarefas/domain/constants/app_endpoints.dart';
import 'package:lista_de_tarefas/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/domain/entities/firestore/db_firestore.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';

@Injectable(as: TaskDatasource)
class TaskDatasourceImpl implements TaskDatasource {
  @override
  Future<VoidSuccess> deleteTask({required TaskEntity task}) async {
    try {
      final FirebaseFirestore db = DBFirestore.get();
      await db.collection(AppEndpoints.tarefa.endpoint).doc(task.id).delete();
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    try {
      final db = DBFirestore.get();

      final QuerySnapshot<Map<String, dynamic>> response =
          await db.collection(AppEndpoints.tarefa.endpoint).get();

      final List<TaskEntity> tasks = response.docs
          .map(
            (json) => TaskModal.fromJson(json.data()).toEntity().copyWith(
                  id: json.reference.id,
                ),
          )
          .toList();
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskEntity> postTask({required TaskEntity task}) async {
    try {
      final FirebaseFirestore db = DBFirestore.get();
      final DocumentReference<Map<String, dynamic>> result =
          await db.collection(AppEndpoints.tarefa.endpoint).add(
                TaskModal.fromEntity(task).toJson(),
              );
      return task.copyWith(id: result.id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VoidSuccess> updateTask({required TaskEntity task}) async {
    try {
      final FirebaseFirestore db = DBFirestore.get();
      await db
          .collection(AppEndpoints.tarefa.endpoint)
          .doc(task.id!)
          .update(TaskModal.fromEntity(task).toJson());
      return const VoidSuccess();
    } catch (e) {
      rethrow;
    }
  }
}
