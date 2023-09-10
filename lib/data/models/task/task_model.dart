import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/task/task_entity.dart';

part 'task_model.g.dart';
part 'task_model.mapper.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class TaskModal extends TaskEntity {
  TaskModal({
    required super.name,
    required super.description,
    required super.situation,
    required super.dateTime,
    super.createdAt,
    super.id,
  });

  factory TaskModal.fromJson(Map<String, dynamic> json) =>
      _$TaskModalFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModalToJson(this);

  factory TaskModal.fromEntity(TaskEntity entity) =>
      _$TaskModalFromEntity(entity);
  TaskEntity toEntity() => _$TaskModalToEntity(this);
}
