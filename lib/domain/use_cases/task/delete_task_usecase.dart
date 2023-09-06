import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/domain/entities/failure/failure.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/domain/repositories/task/task_repository.dart';

@injectable
class DeleteTaskUsecase {
  final TaskRepository _repository;

  DeleteTaskUsecase({required TaskRepository repository})
      : _repository = repository;

  Future<EitherOf<Failure, VoidSuccess>> call({required TaskEntity task}) {
    return _repository.deleteTask(task: task);
  }
}
