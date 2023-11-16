import 'dart:convert';
import 'package:intl/intl.dart';

class MoviesModel {
  bool adult = false;
  String backdropPath = "";
  List<int> genreIds = [];
  int id = 0;
  String originalLanguage = "en";
  String originalTitle = "";
  String overview = "";
  double popularity = 0.0;
  String posterPath = "";
  String releaseDate = "";
  String title = "";
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  String get releaseDateFormatted {
    if (releaseDate.isEmpty) {
      return "";
    }

    return DateFormat("MMMM dd, yyyy")
        .format(DateFormat("yyyy-MM-dd").parse(releaseDate));
  }

  MoviesModel.empty();
  MoviesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesModel.fromJson(String source) =>
      MoviesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoviesModel(adult: $adult, backdrop_path: $backdropPath, genre_ids: $genreIds, id: $id, original_language: $originalLanguage, original_title: $originalTitle, overview: $overview, popularity: $popularity, poster_path: $posterPath, release_date: $releaseDate, title: $title, video: $video, vote_average: $voteAverage, vote_count: $voteCount)';
  }
}
