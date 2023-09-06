import 'package:lista_de_tarefas/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';

import '../../entities/failure/failure.dart';

abstract class TaskRepository {
  Future<EitherOf<Failure, List<TaskEntity>>> getTasks();
  Future<EitherOf<Failure, TaskEntity>> postTask({required TaskEntity task});
  Future<EitherOf<Failure, VoidSuccess>> deleteTask({required TaskEntity task});
  Future<EitherOf<Failure, VoidSuccess>> updateTask({required TaskEntity task});
}
