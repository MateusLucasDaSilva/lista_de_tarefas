import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';

abstract class TarefaReporitory {
  Future<List<TaskEntity>> getAllTarefas();

  Future<void> save(TaskEntity tarefa);

  Future<void> update(TaskEntity tarefa);

  Future<void> delete(TaskEntity tarefa);
}
