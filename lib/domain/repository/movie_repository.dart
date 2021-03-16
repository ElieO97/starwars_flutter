import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';

/// Interface defining methods for how the data layer can pass data to and from the Domain layer.
/// This is to be implemented by the data layer, setting the requirements for the
/// operations that need to be implemented
abstract class MoviesRepository {
  Future<List<Movie>> fetchAllMovies();

  Future<void> clearMovies();

  Future<void> saveMovies(List<Movie> movies);

  Future<List<Character>> fetchMovieCharacters(
      int movieId, List<String> charactersIds);
}
