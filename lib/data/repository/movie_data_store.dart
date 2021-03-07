import 'package:star_wars_flutter/data/model/movie_entity.dart';

abstract class MovieDataStore {
  Future<List<MovieEntity>> fetchAllMovies();
}