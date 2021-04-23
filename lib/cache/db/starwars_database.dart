import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/data/model/character_entity.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';

abstract class StarWarsDatabase {
  Future<void> insertMovie(MovieEntity movie);
  Future<void> insertCharacter(int movieId, CharacterEntity character);

  Future<List<CachedMovie>> getMovies();
  Future<List<CachedCharacter>> getCharactersForMovieId(int movieId);
  Future<CachedCharacter?> getCharacter(String characterId);
}
