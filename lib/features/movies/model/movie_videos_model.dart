// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MovieVideosModel {
  String iso_639_1 = "en";
  String iso_3166_1 = "US";
  String name = "";
  String key = "";
  String site = "YouTube";
  int size = 0;
  String type = "";
  bool official = false;
  String publishedAt = ""; //2022-02-18T17:00:25.000Z
  String id = "";
  MovieVideosModel({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_639_1': iso_639_1,
      'iso_3166_1': iso_3166_1,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }

  factory MovieVideosModel.fromMap(Map<String, dynamic> map) {
    return MovieVideosModel(
      iso_639_1: map['iso_639_1'] as String,
      iso_3166_1: map['iso_3166_1'] as String,
      name: map['name'] as String,
      key: map['key'] as String,
      site: map['site'] as String,
      size: map['size'] as int,
      type: map['type'] as String,
      official: map['official'] as bool,
      publishedAt: map['published_at'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieVideosModel.fromJson(String source) =>
      MovieVideosModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieVideosModel(iso_639_1: $iso_639_1, iso_3166_1: $iso_3166_1, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, published_at: $publishedAt, id: $id)';
  }
}
