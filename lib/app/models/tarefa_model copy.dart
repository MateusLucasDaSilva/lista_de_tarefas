import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class TarefaModelCopy {
  final String? id;
  final String name;
  final String description;
  final String situation;
  TarefaModelCopy({
    this.id,
    required this.name,
    required this.description,
    required this.situation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'situation': situation,
    };
  }

  factory TarefaModelCopy.fromMap(Map<String, dynamic> map) {
    return TarefaModelCopy(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      situation: map['situation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TarefaModelCopy.fromJson(String source) => TarefaModelCopy.fromMap(json.decode(source) as Map<String, dynamic>);
}
