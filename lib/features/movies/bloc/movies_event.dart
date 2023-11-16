part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

class MoviesInitialFetchEvent extends MoviesEvent {}

class MovieDetailsInitialFetchEvent extends MoviesEvent {
  final int movieId;

  MovieDetailsInitialFetchEvent({required this.movieId});
}
