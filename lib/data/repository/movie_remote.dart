import 'package:star_wars_flutter/data/model/movie_entity.dart';

abstract class MovieRemote {
  Future<List<MovieEntity>> fetchAllMovies();
}
