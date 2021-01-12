

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/models/movie.dart';


class StarWarsDatabase {

   StarWarsDatabase._();

   static final StarWarsDatabase starWarsDatabase = StarWarsDatabase._();
   Database _database;


   Future<Database> get database async  {
     if (_database != null)
       return _database;

     _database = await getDatabaseInstance();
     return _database;

   }

   Future<Database> getDatabaseInstance() async {
     return await openDatabase(
       join(await getDatabasesPath(), 'starwars_database.db'),
       onCreate: (Database db, int version) async {
         await db.execute(
           'CREATE TABLE Movie(id INTEGER PRIMARY KEY, title TEXT, director TEXT, releaseDate TEXT, producer TEXT, plot TEXT, url TEXT, character TEXT);',
         );

         await db.execute(
           'CREATE TABLE Character(id TEXT PRIMARY KEY, birthDay TEXT, eyeColor TEXT, gender TEXT, hairColor TEXT, height TEXT, homeWorld TEXT, mass TEXT, name TEXT);',
         );

         await db.execute(
           'CREATE TABLE movie_character_join(id TEXT PRIMARY KEY, FOREIGN KEY (movie_id) REFERENCES Movie(id), FOREIGN KEY (character_id) REFERENCES Character(id));',
         );

       },
       version: 1,
     );
   }

   Future<void> insertMovie(Movie movie) async {
     final Database db = await database;

     await db.insert(
       'Movie',
        movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
     );
   }

   Future<List<Movie>> getMovies() async {
     final Database db = await database;
     final List<Map<String, dynamic>> maps = await db.query('Movie');

     return List.generate(maps.length, (int i) {
       return Movie(
           id: maps[i]['id'] as int,
           title: maps[i]['title'] as String,
           director: maps[i]['director'] as String,
           releaseDate: maps[i]['releaseDate'] as String,
           producer: maps[i]['producer'] as String,
           plot: maps[i]['plot'] as String,
           url: maps[i]['url'] as String,
           character:  maps[i]['character'] as String,
       );

     });
   }

   Future<void> insertCharacter(Movie movie, Character character) async {
     final Database db = await database;

     await db.insert(
         'Character',
         character.toMap(),
         conflictAlgorithm: ConflictAlgorithm.replace
     );

     await db.insert(
         'movie_character_join',
         <String, dynamic>{
           'id': '${movie.id}_${character.id}',
           'movie_id': movie.id,
           'character_id': character.id,
         },
         conflictAlgorithm: ConflictAlgorithm.replace
     );

   }

   Future<List<Character>> getCharacterWithMovieId(Movie movie) async {
     final Database db = await database;
     List<Map> entities = await db.rawQuery('SELECT * FROM  movie_character_join WHERE movie_id = ${movie.id}');
     final List<dynamic> characterIds =  entities.map<dynamic>((Map map) => map['character_id']).toList();

     final List<Character> characters = <Character>[];
     for(final dynamic id in characterIds) {
       final Character character = await getCharacter(id as String);
       characters.add(character);
     }

     return characters;
   }

   Future<Character> getCharacter(String characterId) async {
     final Database db = await database;
     final List<Map<String, dynamic>> map = await db.rawQuery('SELECT * FROM Character WHERE id = $characterId');

     if (map != null || map.isNotEmpty) {
       return Character(
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