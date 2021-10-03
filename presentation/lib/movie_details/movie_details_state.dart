import 'package:presentation/model/movie_view_model.dart';

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
  MovieDetailsPopulated(this.movie);

  MovieViewModel movie;

  MovieDetailsPopulated update({required MovieViewModel nuMovie}) {
    return this..movie = nuMovie;
  }
}

class MovieDetailsEmpty extends MovieDetailsState {}
