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

import '../data/data_sources/task/task_datasource.dart' as _i3;
import '../data/data_sources/task/task_datasource_impl.dart' as _i4;
import '../data/repositories/task_repository_impl.dart' as _i6;
import '../domain/repositories/task/task_repository.dart' as _i5;
import '../domain/use_cases/task/delete_task_usecase.dart' as _i8;
import '../domain/use_cases/task/get_tasks_usecase.dart' as _i9;
import '../domain/use_cases/task/post_task_usecase.dart' as _i11;
import '../domain/use_cases/task/update_task_usecase.dart' as _i7;
import '../presentation/screens/home/controller/home_controller.dart' as _i10;

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
    gh.factory<_i3.TaskDatasource>(() => _i4.TaskDatasourceImpl());
    gh.factory<_i5.TaskRepository>(
        () => _i6.TaskRepositoryImpl(datasource: gh<_i3.TaskDatasource>()));
    gh.factory<_i7.UpdateTaskUsecase>(
        () => _i7.UpdateTaskUsecase(repository: gh<_i5.TaskRepository>()));
    gh.factory<_i8.DeleteTaskUsecase>(
        () => _i8.DeleteTaskUsecase(repository: gh<_i5.TaskRepository>()));
    gh.factory<_i9.GetTasksUsecase>(
        () => _i9.GetTasksUsecase(repository: gh<_i5.TaskRepository>()));
    gh.factory<_i10.HomeController>(
        () => _i10.HomeController(getTasksUsecase: gh<_i9.GetTasksUsecase>()));
    gh.factory<_i11.PostTaskUsecase>(
        () => _i11.PostTaskUsecase(repository: gh<_i5.TaskRepository>()));
    return this;
  }
}
