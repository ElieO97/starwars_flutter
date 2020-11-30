

import 'package:star_wars_flutter/models/movie.dart';

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
  Movie movie;

  MovieDetailsPopulated update({Movie nuMovie}) {
    return this..movie = nuMovie;
  }
}

class MovieDetailsEmpty extends MovieDetailsState {}