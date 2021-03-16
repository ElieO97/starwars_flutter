import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';

abstract class MovieDataStore {
  Future<List<MovieEntity>> fetchAllMovies();

  Future<void> saveMovies(List<MovieEntity> movies);

  Future<void> clearMovies();

  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity);
}
