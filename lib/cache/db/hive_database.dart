import 'package:star_wars_flutter/cache/db/starwars_database.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:hive/hive.dart';

class HiveDatabase implements StarWarsDatabase {
  HiveDatabase._();

  static final HiveDatabase database = HiveDatabase._();

  Box<CachedMovie>? _movieDatabase;
  Box<CachedCharacter>? _characterDatabase;

  Future<Box<CachedCharacter>> get characterDatabase async {
    if (_characterDatabase != null) return _characterDatabase!;

    _characterDatabase = await getCharacterDatabaseInstance();
    return _characterDatabase!;
  }

  Future<Box<CachedCharacter>> getCharacterDatabaseInstance() async {
    return await Hive.openBox<CachedCharacter>('Characters');
  }

  Future<Box<CachedMovie>> get movieDatabase async {
    if (_movieDatabase != null) return _movieDatabase!;

    _movieDatabase = await getMovieDatabaseInstance();
    return _movieDatabase!;
  }

  Future<Box<CachedMovie>> getMovieDatabaseInstance() async {
    return await Hive.openBox<CachedMovie>('Movies');
  }

  @override
  Future<CachedCharacter?> getCharacter(String characterId) async {
    final Box<CachedCharacter> characters = await characterDatabase;
    return characters.get(characterId);
  }

  @override
  Future<List<CachedCharacter>> getCharactersForMovieId(int movieId) async {
    final Box<CachedMovie> movies = await movieDatabase;
    final CachedMovie? movie = movies.get(movieId.toString());
    return movie?.characters ?? [];
  }

  @override
  Future<void> insertCharacter(int movieId, CachedCharacter character) async {
    final Box<CachedCharacter> characters = await characterDatabase;
    final Box<CachedMovie> movies = await movieDatabase;
    final CachedMovie? movie = movies.get(movieId.toString());
    characters.put(character.id, character);
    movie?.characters.add(character);
    movie?.save();
  }

  @override
  Future<List<CachedMovie>> getMovies() async {
    final Box<CachedMovie> movies = await movieDatabase;
    return movies.values.toList();
  }

  @override
  Future<void> insertMovie(CachedMovie movie) async {
    final Box<CachedMovie> movies = await movieDatabase;
    movies.put(movie.id.toString(), movie);
  }
}
