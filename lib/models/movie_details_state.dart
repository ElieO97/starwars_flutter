

import 'package:star_wars_flutter/api/models/swapi_movie.dart';

class MovieDetailsState {
  MovieDetailsState();
}

class MovieDetailsLoading extends MovieDetailsState{}
class MovieDetailsError extends MovieDetailsState {
  MovieDetailsError(this.error);
  final String error;
}

class MovieDetailsNoResults extends MovieDetailsState {}

class MovieDetailsPopulated extends MovieDetailsState {

  MovieDetailsPopulated(this.movie);
  SwapiMovie movie;

  MovieDetailsPopulated update({SwapiMovie nuMovie}) {
    return this..movie = nuMovie;
  }
}

class MovieDetailsEmpty extends MovieDetailsState {}