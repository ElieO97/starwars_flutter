import 'package:star_wars_flutter/models/movie.dart';

class MoviesState {
  MoviesState();
}

class MoviesLoading extends MoviesState {}

class MoviesError extends MoviesState {
  MoviesError(this.error);

  final String error;
}

class MoviesNoResults extends MoviesState {}

class MoviesPopulated extends MoviesState {
  MoviesPopulated(this.movies);

  final List<Movie> movies;

  MoviesPopulated update({List<Movie> nuMovies}) {
    return this..movies.addAll(nuMovies ?? movies);
  }
}

class MoviesEmpty extends MoviesState {}
