// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModal _$TaskModalFromJson(Map json) => TaskModal(
      name: json['name'] as String,
      description: json['description'] as String,
      situation: json['situation'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TaskModalToJson(TaskModal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'situation': instance.situation,
      'createdAt': instance.createdAt?.toIso8601String(),
      'dateTime': instance.dateTime.toIso8601String(),
    };
