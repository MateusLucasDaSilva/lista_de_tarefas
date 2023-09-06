import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/domain/entities/app_global/app_global.dart';
import 'package:lista_de_tarefas/domain/entities/app_message/app_message.dart';
import 'package:lista_de_tarefas/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/domain/entities/failure/failure.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/domain/use_cases/task/delete_task_usecase.dart';
import 'package:lista_de_tarefas/domain/use_cases/task/get_tasks_usecase.dart';
import 'package:lista_de_tarefas/domain/use_cases/task/post_task_usecase.dart';
import 'package:lista_de_tarefas/domain/use_cases/task/update_task_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final GetTasksUsecase _getTasksUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final UpdateTaskUsecase _updateTaskUsecase;
  final PostTaskUsecase _postTaskUsecase;

  HomeControllerBase({
    required GetTasksUsecase getTasksUsecase,
    required DeleteTaskUsecase deleteTaskUsecase,
    required UpdateTaskUsecase updateTaskUsecase,
    required PostTaskUsecase postTaskUsecase,
  })  : _getTasksUsecase = getTasksUsecase,
        _deleteTaskUsecase = deleteTaskUsecase,
        _updateTaskUsecase = updateTaskUsecase,
        _postTaskUsecase = postTaskUsecase;

  @observable
  ObservableList<TaskEntity> tasks = ObservableList<TaskEntity>();

  @action
  void _setTasks(List<TaskEntity> newTasks) {
    tasks = ObservableList.of(newTasks);
  }

  @action
  void _updateTaskFromList(TaskEntity task) {
    final index = tasks.indexWhere((element) => element.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  @action
  void removeTaskFromList(TaskEntity task) {
    tasks.remove(task);
  }

  @action
  void setNewTaskFromList(TaskEntity newTask) {
    tasks.add(newTask);
  }

  Future<void> getTasks() async {
    final EitherOf<Failure, List<TaskEntity>> result = await _getTasksUsecase();

    result.get((reject) {
      AppGlobal.instance.streamError.add(reject);
    }, (resolve) {
      _setTasks(resolve);
    });
  }

  Future<void> updateTask(TaskEntity task) async {
    final EitherOf<Failure, VoidSuccess> result =
        await _updateTaskUsecase(task: task);

    result.get(
      (Failure reject) {
        AppGlobal.instance.streamError.add(reject);
      },
      (VoidSuccess resolve) {
        _updateTaskFromList(task);
        AppGlobal.instance.streamMessage.add(
          AppMessage(
            message: 'Sua tarefa foi Atualizada com sucesso!',
            type: AppMessageType.success,
          ),
        );
      },
    );
  }

  Future<void> deleteTask(TaskEntity task) async {
    final EitherOf<Failure, VoidSuccess> result =
        await _deleteTaskUsecase(task: task);

    result.get(
      (Failure reject) {
        AppGlobal.instance.streamError.add(reject);
      },
      (VoidSuccess resolve) {
        removeTaskFromList(task);
        AppGlobal.instance.streamMessage.add(
          AppMessage(
            message: 'Sua tarefa foi apagada!',
            type: AppMessageType.alert,
          ),
        );
      },
    );
  }

  Future<void> postTask(TaskEntity task) async {
    final EitherOf<Failure, TaskEntity> result =
        await _postTaskUsecase(task: task);

    result.get(
      (Failure reject) {
        AppGlobal.instance.streamError.add(reject);
      },
      (TaskEntity resolve) {
        setNewTaskFromList(task);
        AppGlobal.instance.streamMessage.add(
          AppMessage(
            message: 'Sua tarefa registrada com sucesso!',
            type: AppMessageType.success,
          ),
        );
      },
    );
  }
}
