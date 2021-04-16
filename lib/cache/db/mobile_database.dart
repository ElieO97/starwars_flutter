import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/cache/db/starwars_database.dart';

class MobileDatabase implements StarWarsDatabase {
  MobileDatabase._();

  static final MobileDatabase moblieDatabase = MobileDatabase._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'starwars_database.db'),
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Movie(id INTEGER PRIMARY KEY, title TEXT, director TEXT, releaseDate TEXT, producer TEXT, plot TEXT, url TEXT, character TEXT, imdbRating FLOAT);',
        );

        await db.execute(
          'CREATE TABLE Character(id TEXT PRIMARY KEY, birthDay TEXT, eyeColor TEXT, gender TEXT, hairColor TEXT, height TEXT, homeWorld TEXT, mass TEXT, name TEXT);',
        );

        await db.execute(
          'CREATE TABLE movie_character_join(id TEXT PRIMARY KEY, movie_id TEXT,  character_id TEXT, FOREIGN KEY (movie_id) REFERENCES Movie(id), FOREIGN KEY (character_id) REFERENCES Character(id));',
        );
      },
      version: 1,
    );
  }

  Future<void> insertMovie(CachedMovie movie) async {
    final Database db = await database;

    await db.insert('Movie', movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CachedMovie>> getMovies() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Movie');

    return List.generate(maps.length, (int i) {
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
  }

  Future<void> insertCharacter(int movieId, CachedCharacter character) async {
    final Database db = await database;

    await db.insert('Character', character.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    await db.insert(
        'movie_character_join',
        <String, dynamic>{
          'id': '${movieId}_${character.id}',
          'movie_id': movieId,
          'character_id': character.id,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CachedCharacter>> getCharacterWithMovieId(int movieId) async {
    final Database db = await database;
    final List<Map> entities = await db.rawQuery(
        'SELECT * FROM  movie_character_join WHERE movie_id = $movieId');
    final List<dynamic> characterIds =
        entities.map<dynamic>((Map map) => map['character_id']).toList();

    final List<CachedCharacter> characters = <CachedCharacter>[];
    for (final dynamic id in characterIds) {
      final CachedCharacter character = await getCharacter(id as String);
      characters.add(character);
    }

    return characters;
  }

  Future<CachedCharacter> getCharacter(String characterId) async {
    final Database db = await database;
    final List<Map<String, dynamic>> map =
        await db.rawQuery('SELECT * FROM Character WHERE id = $characterId');

    if (map != null || map.isNotEmpty) {
      return CachedCharacter(
          id: map[0]['id'] as String,
          birthDay: map[0]['birthDay'] as String,
          eyeColor: map[0]['eyeColor'] as String,
          gender: map[0]['gender'] as String,
          hairColor: map[0]['hairColor'] as String,
          height: map[0]['height'] as String,
          homeWorld: map[0]['homeWorld'] as String,
          mass: map[0]['mass'] as String,
          name: map[0]['name'] as String);
    }

    return null;
  }
}
