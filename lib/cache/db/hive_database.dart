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
  Future<List<CachedCharacter>> getCharacterWithMovieId(int movieId) async {
    return [];
  }

  @override
  Future<void> insertCharacter(int movieId, CachedCharacter character) async {
//     final db = await characterDatabase;
//     await db.put(character.id.toString(), character.toMap());
  }

  @override
  Future<List<CachedMovie>> getMovies() async {
    // NOTE: when this is called on a refresh, this error is thrown:
    // Expected a value of type 'Map<String, dynamic>', but got one of type 'LinkedMap<dynamic, dynamic>'
    // Even though the data is stored in the db and can be accessed after insertMovie is called
    // Not sure why this error comes up (possibly old version?)

//     final db = await movieDatabase;
//     var list = List.generate(db.values.length, (int i) {
//       var movie = db.getAt(i);
//       return CachedMovie(
//         id: movie['id'] as int,
//         title: movie['title'] as String,
//         director: movie['director'] as String,
//         releaseDate: movie['releaseDate'] as String,
//         producer: movie['producer'] as String,
//         plot: movie['plot'] as String,
//         url: movie['url'] as String,
//         character: movie['character'] as String,
//         imdbRating: movie['imdbRating'] as double,
//       );
//     });
//     return list;
//     return [];
    final Box<CachedMovie> movies = await movieDatabase;
    return movies.values.toList();
  }

  @override
  Future<void> insertMovie(CachedMovie movie) async {
    final Box<CachedMovie> movies = await movieDatabase;
    movies.add(movie);
  }
}
