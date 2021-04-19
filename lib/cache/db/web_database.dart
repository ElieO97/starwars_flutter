import 'package:star_wars_flutter/cache/db/starwars_database.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:hive/hive.dart';

class WebDatabase implements StarWarsDatabase {
  WebDatabase._();

  static final WebDatabase webDatabase = WebDatabase._();

  Box<Map<String, dynamic>> _movieDatabase;
  Box<Map<String, dynamic>> _characterDatabase;

  Future<Box<Map<String, dynamic>>> get characterDatabase async {
    if (_characterDatabase != null) return _characterDatabase;

    _characterDatabase = await getCharacterDatabaseInstance();
    return _characterDatabase;
  }

  Future<Box<Map<String, dynamic>>> getCharacterDatabaseInstance() async {
    return await Hive.openBox<Map<String, dynamic>>('Character');
  }

  Future<Box<Map<String, dynamic>>> get movieDatabase async {
    if (_movieDatabase != null) return _movieDatabase;

    _movieDatabase = await getMovieDatabaseInstance();
    return _movieDatabase;
  }

  Future<Box<Map<String, dynamic>>> getMovieDatabaseInstance() async {
    return await Hive.openBox<Map<String, dynamic>>('Movie');
  }

  @override
  Future<CachedCharacter> getCharacter(String characterId) async {
    final Box<Map<String, dynamic>> db = await characterDatabase;
    // TODO: implement getCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<CachedCharacter>> getCharacterWithMovieId(int movieId) async {
    final Box<Map<String, dynamic>> db = await characterDatabase;
    // TODO: implement getCharacterWithMovieId
    throw UnimplementedError();
  }

  @override
  Future<void> insertCharacter(int movieId, CachedCharacter character) async {
    final Box<Map<String, dynamic>> db = await characterDatabase;
//     await db.put(movie.id, movie);
    throw UnimplementedError();
  }

  @override
  Future<List<CachedMovie>> getMovies() async {
    final Box<Map<String, dynamic>> db = await movieDatabase;
    final List<Map<String, dynamic>> maps = db.values.toList();
    var list = List.generate(maps.length, (int i) {
      return CachedMovie(
        id: maps[i]['id'] as int,
        title: maps[i]['title'] as String,
        director: maps[i]['director'] as String,
        releaseDate: maps[i]['releaseDate'] as String,
        producer: maps[i]['producer'] as String,
        plot: maps[i]['plot'] as String,
        url: maps[i]['url'] as String,
        character: maps[i]['character'] as String,
        imdbRating: maps[i]['imdbRating'] as double,
      );
    });
    print(list);
    return list;
  }

  @override
  Future<void> insertMovie(CachedMovie movie) async {
    final Box<Map<String, dynamic>> db = await movieDatabase;
    await db.put(movie.id, movie.toMap());
  }
}
