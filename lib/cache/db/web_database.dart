import 'package:star_wars_flutter/cache/db/starwars_database.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';

class WebDatabase implements StarWarsDatabase {
  @override
  Future<CachedCharacter> getCharacter(String characterId) {
    // TODO: implement getCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<CachedCharacter>> getCharacterWithMovieId(int movieId) {
    // TODO: implement getCharacterWithMovieId
    throw UnimplementedError();
  }

  @override
  Future<List<CachedMovie>> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }

  @override
  Future<void> insertCharacter(int movieId, CachedCharacter character) {
    // TODO: implement insertCharacter
    throw UnimplementedError();
  }

  @override
  Future<void> insertMovie(CachedMovie movie) {
    // TODO: implement insertMovie
    throw UnimplementedError();
  }
}
