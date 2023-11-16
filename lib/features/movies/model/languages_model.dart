// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LanguagesModel {
  String iso_639_1 = "";
  String englishName = "";
  String name = "";
  LanguagesModel({
    required this.iso_639_1,
    required this.englishName,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_639_1': iso_639_1,
      'english_name': englishName,
      'name': name,
    };
  }

  factory LanguagesModel.fromMap(Map<String, dynamic> map) {
    return LanguagesModel(
      iso_639_1: map['iso_639_1'],
      englishName: map['english_name'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguagesModel.fromJson(String source) =>
      LanguagesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LanguagesModel(iso_639_1: $iso_639_1, english_name: $englishName, name: $name)';
}
