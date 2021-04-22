import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';

abstract class StarWarsDatabase {
  Future<void> insertMovie(CachedMovie movie);
  Future<List<CachedMovie>> getMovies();
  Future<void> insertCharacter(int movieId, CachedCharacter character);
  Future<List<CachedCharacter>> getCharactersForMovieId(int movieId);
  Future<CachedCharacter?> getCharacter(String characterId);
}
