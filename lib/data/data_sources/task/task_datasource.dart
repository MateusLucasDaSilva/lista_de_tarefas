import 'package:lista_de_tarefas/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';

abstract class TaskDatasource {
  Future<List<TaskEntity>> getTasks();
  Future<TaskEntity> postTask({required TaskEntity task});
  Future<VoidSuccess> deleteTask({required TaskEntity task});
  Future<VoidSuccess> updateTask({required TaskEntity task});
}
