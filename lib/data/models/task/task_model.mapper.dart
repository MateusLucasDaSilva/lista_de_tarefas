part of 'task_model.dart';

TaskModal _$TaskModalFromEntity(TaskEntity entity) => TaskModal(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      situation: entity.situation,
    );

TaskEntity _$TaskModalToEntity(TaskModal model) => TaskEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      situation: model.situation,
    );
