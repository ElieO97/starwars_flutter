import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';

abstract class MovieCache {
  Future<List<MovieEntity>> fetchAllMovies();

  Future<bool> isCached();

  Future<void> saveMovies(List<MovieEntity> movies);

  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity);
}
