import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/images_model.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/movie_details_model.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/movies_model.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/repos/movies_repo.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesInitialFetchEvent>(moviesInitialFetchEvent);
    on<MovieDetailsInitialFetchEvent>(movieDetailsInitialFetchEvent);
  }

  FutureOr<void> moviesInitialFetchEvent(
      MoviesInitialFetchEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesFetchingLoadingState());
    List<MoviesModel> movies = await MoviesRepo.fetchMovies();

    emit(MoviesFetchingSuccessfulState(movies: movies));
  }

  FutureOr<void> movieDetailsInitialFetchEvent(
      MovieDetailsInitialFetchEvent event, Emitter<MoviesState> emit) async {
    emit(MovieDetailsFetchingLoadingState());
    MovieDetailsModel movieDetails =
        await MoviesRepo.fetchMovieDetails(event.movieId);
    ImageListData movieImageList =
        await MoviesRepo.fetchMovieImageList(event.movieId);

    emit(MovieDetailsFetchingSuccessfulState(
        movieDetails: movieDetails, movieImageList: movieImageList));
  }
}
