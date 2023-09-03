import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/app/src/data/data_sources/task/task_datasource.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/failure/failure.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/app/src/domain/repositories/task/task_repository.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _datasource;

  TaskRepositoryImpl({required TaskDatasource datasource})
      : _datasource = datasource;

  @override
  Future<EitherOf<Failure, VoidSuccess>> deleteTask(
      {required TaskEntity task}) async {
    try {
      final VoidSuccess result = await _datasource.deleteTask(task: task);
      return resolve(result);
    } catch (e) {
      log(e.toString());
      return reject(DeleteTaskFailure(message: 'Erro ao Deletar task'));
    }
  }

  @override
  Future<EitherOf<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final List<TaskEntity> result = await _datasource.getTasks();
      return resolve(result);
    } catch (e) {
      log(e.toString());
      return reject(GetTasksFailure(message: 'Erro ao buscar tasks'));
    }
  }

  @override
  Future<EitherOf<Failure, TaskEntity>> postTask(
      {required TaskEntity task}) async {
    try {
      final TaskEntity result = await _datasource.postTask(task: task);
      return resolve(result);
    } catch (e) {
      log(e.toString());
      return reject(PostTaskFailure(message: 'Erro ao inserir task'));
    }
  }

  @override
  Future<EitherOf<Failure, VoidSuccess>> updateTask(
      {required TaskEntity task}) async {
    try {
      final VoidSuccess result = await _datasource.updateTask(task: task);
      return resolve(result);
    } catch (e) {
      log(e.toString());
      return reject(UpdateTaskFailure(message: 'Erro ao atualizar task'));
    }
  }
}
