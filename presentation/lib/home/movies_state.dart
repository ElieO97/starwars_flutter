import 'package:presentation/model/movie_view_model.dart';

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

  final List<MovieViewModel> movies;

  MoviesPopulated update({List<MovieViewModel>? nuMovies}) {
    return this..movies.addAll(nuMovies ?? movies);
  }
}

class MoviesEmpty extends MoviesState {}
