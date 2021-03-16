import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_cache.dart';
import 'package:star_wars_flutter/data/repository/movie_data_store.dart';

class MovieCacheDataStore implements MovieDataStore {
  MovieCacheDataStore(this._movieCache);

  final MovieCache _movieCache;

  @override
  Future<List<MovieEntity>> fetchAllMovies() {
    return _movieCache.fetchAllMovies();
  }

  @override
  Future<void> saveMovies(List<MovieEntity> movies) {}

  @override
  Future<void> clearMovies() {}

  @override
  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity) {
    throw UnimplementedError();
  }
}
