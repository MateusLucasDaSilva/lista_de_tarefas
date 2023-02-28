import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TarefaModel {
  final String name;
  final String description;
  final String situation;
  TarefaModel({
    required this.name,
    required this.description,
    required this.situation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'situation': situation,
    };
  }

  factory TarefaModel.fromMap(Map<String, dynamic> map) {
    return TarefaModel(
      name: map['name'] as String,
      description: map['description'] as String,
      situation: map['situation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TarefaModel.fromJson(String source) => TarefaModel.fromMap(json.decode(source) as Map<String, dynamic>);

 
}
