// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModal _$TaskModalFromJson(Map json) => TaskModal(
      name: json['name'] as String,
      description: json['description'] as String,
      situation: json['situation'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TaskModalToJson(TaskModal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'situation': instance.situation,
    };
