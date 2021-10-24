import 'package:domain/model/character.dart';
import 'package:domain/model/movie.dart';

/// Interface defining methods for how the data layer can pass data to and from the Domain layer.
/// This is to be implemented by the data layer, setting the requirements for the
/// operations that need to be implemented
abstract class MoviesRepository {
  Future<List<Movie>> getMovies();

  Future<List<Character>> getMovieCharacters(
      int movieId, List<String> charactersIds);
}
