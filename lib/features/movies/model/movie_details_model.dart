import 'dart:convert';

import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/genres_model.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/languages_model.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/movie_videos_model.dart';

class MovieDetailsModel {
  bool adult = false;
  String backdropPath = "";
  Map<String, dynamic> belongsToCollection =
      {}; /*{
    "id": 391860,
    "name": "Kingsman Collection",
    "poster_path": "/iR8L2XHA72wmYHc6O8LZmwV5hd5.jpg",
    "backdrop_path": "/4RvHJHSuQUKRzUx8h6a8VAxvbIE.jpg"
  }*/
  double budget = 0;
  List<GenresModel> genres = [];
  String homepage = "";
  int id = 0;
  String imdbId = "";
  String originalLanguage = "en";
  String originalTitle = "";
  String overview = "";
  double popularity = 0;
  String posterPath = "";
  List<Map<String, dynamic>> productionCompanies = [];
  /*{
      "id": 5374,
      "logo_path": "/pMUiImmYANjZUlZFiZMWziQDSs6.png",
      "name": "Marv Films",
      "origin_country": "GB"
    }*/
  List<Map<String, dynamic>> productionCountries = [];
  /*{
      "iso_3166_1": "GB",
      "name": "United Kingdom"
    }*/
  String releaseDate = "";
  double revenue = 0;
  double runtime = 0;
  List<LanguagesModel> spokenLanguages = [];
  String status = "";
  String tagline = "";
  String title = "";
  bool video = false;
  double voteAverage = 0;
  int voteCount = 3993;
  List<MovieVideosModel> movieVideos = [];

  MovieDetailsModel.empty();
  MovieDetailsModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.movieVideos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies': productionCompanies,
      'production_countries': productionCountries,
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'movie_videos': movieVideos
    };
  }

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      belongsToCollection: map['belongs_to_collection'] == null
          ? {}
          : Map<String, dynamic>.from(map['belongs_to_collection']),
      budget: double.tryParse("${map['budget'] ?? 0.0}") ?? 0.0,
      genres: List<GenresModel>.from(
        map['genres'].map<GenresModel>(
          (x) => GenresModel.fromMap(x),
        ),
      ),
      homepage: map['homepage'],
      id: map['id'],
      imdbId: map['imdb_id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      productionCompanies: map['production_companies'] == null
          ? []
          : List<Map<String, dynamic>>.from(
              map['production_companies'].map(
                (x) => x,
              ),
            ),
      productionCountries: map['production_countries'] == null
          ? []
          : List<Map<String, dynamic>>.from(
              map['production_countries'].map(
                (x) => x,
              ),
            ),
      releaseDate: map['release_date'],
      revenue: double.tryParse("${map['revenue']}") ?? 0.0,
      runtime: double.tryParse("${map['runtime']}") ?? 0.0,
      spokenLanguages: List<LanguagesModel>.from(
        map['spoken_languages'].map<LanguagesModel>(
          (x) => LanguagesModel.fromMap(x),
        ),
      ),
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
      movieVideos: map['videos'] != null &&
              map['videos']["results"] != null &&
              map['videos']["results"].isNotEmpty
          ? List<MovieVideosModel>.from(
              map['videos']['results'].map<MovieVideosModel>(
              (x) => MovieVideosModel.fromMap(x),
            ))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsModel.fromJson(String source) =>
      MovieDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetailsModel(adult: $adult, backdrop_path: $backdropPath, belongs_to_collection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdb_id: $imdbId, original_language: $originalLanguage, original_title: $originalTitle, overview: $overview, popularity: $popularity, poster_path: $posterPath, production_companies: $productionCompanies, production_countries: $productionCountries, release_date: $releaseDate, revenue: $revenue, runtime: $runtime, spoken_languages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, vote_average: $voteAverage, vote_count: $voteCount)';
  }
}
