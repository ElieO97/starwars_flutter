import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';

class MovieDetailsState {
  MovieDetailsState();
}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {
  MovieDetailsError(this.error);

  final String error;
}

class MovieDetailsNoResults extends MovieDetailsState {}

class MovieDetailsPopulated extends MovieDetailsState {
  MovieDetailsPopulated(this.movie, this.characters);

  MovieView movie;
  List<Character> characters;

  MovieDetailsPopulated update({MovieView nuMovie}) {
    return this..movie = nuMovie;
  }
}

class MovieDetailsEmpty extends MovieDetailsState {}
