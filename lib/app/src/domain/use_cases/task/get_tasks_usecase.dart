import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/failure/failure.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/app/src/domain/repositories/task/task_repository.dart';

@injectable
class GetTasksUsecase {
  final TaskRepository _repository;

  GetTasksUsecase({required TaskRepository repository})
      : _repository = repository;

  Future<EitherOf<Failure, List<TaskEntity>>> call() {
    return _repository.getTasks();
  }
}
