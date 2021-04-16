import 'package:star_wars_flutter/cache/db/starwars_database.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:hive/hive.dart';

class WebDatabase implements StarWarsDatabase {
  WebDatabase._();

  static final WebDatabase webDatabase = WebDatabase._();
  Box<Map<String, dynamic>> _database;

  Future<Box<Map<String, dynamic>>> get database async {
    if (_database != null) return _database;

    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Box<Map<String, dynamic>>> getDatabaseInstance() async {
    return await Hive.openBox<Map<String, dynamic>>('starwars_database');
  }

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
  Future<void> insertCharacter(int movieId, CachedCharacter character) {
    // TODO: implement insertCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<CachedMovie>> getMovies() async {
//     final Box<Map<String, dynamic>> db = await database;
//     final List<Map<String, dynamic>> maps = db.get('Movie');

//     return List.generate(maps.length, (int i) {
//       return CachedMovie(
//         id: maps[i]['id'] as int,
//         title: maps[i]['title'] as String,
//         director: maps[i]['director'] as String,
//         releaseDate: maps[i]['releaseDate'] as String,
//         producer: maps[i]['producer'] as String,
//         plot: maps[i]['plot'] as String,
//         url: maps[i]['url'] as String,
//         character: maps[i]['character'] as String,
//         imdbRating: maps[i]['imdbRating'] as double,
//       );
//     });
    return [];
  }

  @override
  Future<void> insertMovie(CachedMovie movie) async {
    final Box<Map<String, dynamic>> db = await database;
    await db.put('Movie', movie.toMap());
  }
}
