// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/local_notification/local_notification_service.dart'
    as _i3;
import '../data/data_sources/task/task_datasource.dart' as _i4;
import '../data/data_sources/task/task_datasource_impl.dart' as _i5;
import '../data/repositories/task_repository_impl.dart' as _i7;
import '../domain/repositories/task/task_repository.dart' as _i6;
import '../domain/use_cases/task/delete_task_usecase.dart' as _i9;
import '../domain/use_cases/task/get_tasks_usecase.dart' as _i10;
import '../domain/use_cases/task/post_task_usecase.dart' as _i11;
import '../domain/use_cases/task/update_task_usecase.dart' as _i8;
import '../presentation/screens/home/controller/home_controller.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocalNotificationService>(
        () => _i3.LocalNotificationService());
    gh.factory<_i4.TaskDatasource>(() => _i5.TaskDatasourceImpl());
    gh.factory<_i6.TaskRepository>(
        () => _i7.TaskRepositoryImpl(datasource: gh<_i4.TaskDatasource>()));
    gh.factory<_i8.UpdateTaskUsecase>(
        () => _i8.UpdateTaskUsecase(repository: gh<_i6.TaskRepository>()));
    gh.factory<_i9.DeleteTaskUsecase>(
        () => _i9.DeleteTaskUsecase(repository: gh<_i6.TaskRepository>()));
    gh.factory<_i10.GetTasksUsecase>(
        () => _i10.GetTasksUsecase(repository: gh<_i6.TaskRepository>()));
    gh.factory<_i11.PostTaskUsecase>(
        () => _i11.PostTaskUsecase(repository: gh<_i6.TaskRepository>()));
    gh.factory<_i12.HomeController>(() => _i12.HomeController(
          getTasksUsecase: gh<_i10.GetTasksUsecase>(),
          deleteTaskUsecase: gh<_i9.DeleteTaskUsecase>(),
          updateTaskUsecase: gh<_i8.UpdateTaskUsecase>(),
          postTaskUsecase: gh<_i11.PostTaskUsecase>(),
        ));
    return this;
  }
}
