import 'package:star_wars_flutter/cache/db/starwars_database.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:hive/hive.dart';
import 'package:star_wars_flutter/data/model/character_entity.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';

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
    Hive.registerAdapter(CachedCharacterAdapter());
    return await Hive.openBox<CachedCharacter>('Characters');
  }

  Future<Box<CachedMovie>> get movieDatabase async {
    if (_movieDatabase != null) return _movieDatabase!;

    _movieDatabase = await getMovieDatabaseInstance();
    return _movieDatabase!;
  }

  Future<Box<CachedMovie>> getMovieDatabaseInstance() async {
    Hive.registerAdapter(CachedMovieAdapter());
    return await Hive.openBox<CachedMovie>('Movies');
  }

  @override
  Future<CachedCharacter> getCharacter(String characterId) async {
    throw UnimplementedError();
  }

  @override
  Future<List<CachedCharacter>> getCharactersForMovieId(int movieId) async {
    return [];
  }

  @override
  Future<void> insertCharacter(int movieId, CharacterEntity character) async {
//     final db = await characterDatabase;
//     await db.put(character.id.toString(), character.toMap());
//     final Box<CachedMovie> movies = await movieDatabase;
//     movies.get()
  }

  @override
  Future<List<CachedMovie>> getMovies() async {
    final Box<CachedMovie> movies = await movieDatabase;
    return movies.values.toList();
  }

  @override
  Future<void> insertMovie(MovieEntity movie) async {
    final Box<CachedMovie> movies = await movieDatabase;
    final Box<CachedCharacter> characters = await characterDatabase;
    final HiveList<CachedCharacter> characterList =
        HiveList<CachedCharacter>(characters);
    final CachedMovie cachedMovie = CachedMovie(
        id: movie.id,
        title: movie.title,
        director: movie.director,
        releaseDate: movie.releaseDate,
        producer: movie.producer,
        plot: movie.plot,
        url: movie.url);
    cachedMovie.characters = characterList;
    final convertedCharacters =
        movie.characters.map((String e) => CachedCharacter(url: e)).toList();
    characters.addAll(convertedCharacters);
    cachedMovie.characters.addAll(convertedCharacters);
    movies.put(cachedMovie.id, cachedMovie);
  }
}
