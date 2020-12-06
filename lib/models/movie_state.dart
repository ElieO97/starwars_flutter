


import 'package:star_wars_flutter/api/models/swapi_movie.dart';

class MoviesState {
  MoviesState();
}

class MoviesLoading extends MoviesState{}
class MoviesError extends MoviesState {
  MoviesError(this.error);
  final String error;
}

class MoviesNoResults extends MoviesState {}

class MoviesPopulated extends MoviesState {

  MoviesPopulated(this.movies);
  final List<SwapiMovie> movies;

  MoviesPopulated update({List<SwapiMovie> nuMovies}) {
    return this..movies.addAll(nuMovies ?? movies);
  }
}

class MoviesEmpty extends MoviesState {}
