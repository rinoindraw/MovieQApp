part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

class MoviesFetchingLoadingState extends MoviesState {}

class MoviesFetchingErrorState extends MoviesState {}

class MoviesFetchingSuccessfulState extends MoviesState {
  final List<MoviesModel> movies;
  MoviesFetchingSuccessfulState({
    required this.movies,
  });
}

class MovieDetailsFetchingLoadingState extends MoviesState {}

class MovieDetailsFetchingErrorState extends MoviesState {}

class MovieDetailsFetchingSuccessfulState extends MoviesState {
  final MovieDetailsModel movieDetails;
  final ImageListData movieImageList;
  MovieDetailsFetchingSuccessfulState({
    required this.movieDetails,
    required this.movieImageList,
  });
}
