import 'package:cache/model/cached_character.dart';
import 'package:cache/model/cached_movie.dart';

abstract class StarWarsDatabase {
  Future<void> insertMovie(CachedMovie movie);
  Future<void> insertCharacter(int movieId, CachedCharacter character);

  Future<List<CachedMovie>> getMovies();
  Future<List<CachedCharacter>> getCharactersForMovieId(int movieId);
  Future<CachedCharacter?> getCharacter(String characterId);
}
