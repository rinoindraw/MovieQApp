import 'dart:convert';

class GenresModel {
  int id = 0;
  String name = "";
  GenresModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresModel.fromJson(String source) =>
      GenresModel.fromMap(json.decode(source));

  @override
  String toString() => 'GenresModel(id: $id, name: $name)';
}
