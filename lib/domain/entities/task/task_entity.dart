// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskEntity {
  final String? id;
  final String name;
  final String description;
  final String situation;
  final DateTime? createdAt;
  final DateTime dateTime;
  TaskEntity({
    this.id,
    this.createdAt,
    required this.dateTime,
    required this.situation,
    required this.name,
    required this.description,
  });

  TaskEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? situation,
    DateTime? createdAt,
    DateTime? dateTime,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      situation: situation ?? this.situation,
      createdAt: createdAt ?? this.createdAt,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  bool operator ==(covariant TaskEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.situation == situation &&
        other.createdAt == createdAt &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        situation.hashCode ^
        createdAt.hashCode ^
        dateTime.hashCode;
  }
}
