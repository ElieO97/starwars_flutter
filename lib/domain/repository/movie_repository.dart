import 'package:star_wars_flutter/domain/model/movie.dart';

/// Interface defining methods for how the data layer can pass data to and from the Domain layer.
/// This is to be implemented by the data layer, setting the requirements for the
/// operations that need to be implemented
abstract class MoviesRepository {
  Future<List<Movie>> fetchAllMovies();
}
