import 'package:star_wars_flutter/data/model/movie_entity.dart';

abstract class MovieCache {
  Future<List<MovieEntity>> fetchAllMovies();

  Future<bool> isCached();
}