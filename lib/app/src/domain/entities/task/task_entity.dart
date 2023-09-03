// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskEntity {
  final String? id;
  final String name;
  final String description;
  final String situation;
  TaskEntity({
    this.id,
    required this.name,
    required this.description,
    required this.situation,
  });

  TaskEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? situation,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      situation: situation ?? this.situation,
    );
  }
}
