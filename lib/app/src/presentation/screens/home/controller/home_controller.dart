import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/app_global/app_global.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/either_of/either_of.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/failure/failure.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/app/src/domain/use_cases/task/get_tasks_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final GetTasksUsecase _getTasksUsecase;

  HomeControllerBase({required GetTasksUsecase getTasksUsecase})
      : _getTasksUsecase = getTasksUsecase;

  @observable
  ObservableList<TaskEntity> tasks = ObservableList<TaskEntity>();

  @action
  void _setTasks(List<TaskEntity> newTasks) {
    tasks = ObservableList.of(newTasks);
  }

  Future<void> getTasks() async {
    final EitherOf<Failure, List<TaskEntity>> result = await _getTasksUsecase();

    result.get((reject) {
      AppGlobal.instance.streamError.add(reject);
    }, (resolve) {
      _setTasks(resolve);
    });
  }
}
