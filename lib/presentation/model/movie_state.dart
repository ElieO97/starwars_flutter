import 'package:star_wars_flutter/presentation/model/movie_view.dart';

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

  final List<MovieView> movies;

  MoviesPopulated update({List<MovieView>? nuMovies}) {
    return this..movies.addAll(nuMovies ?? movies);
  }
}

class MoviesEmpty extends MoviesState {}
