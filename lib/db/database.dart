

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
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
       onCreate: (Database db, int version) {
         db.execute(
           'CREATE TABLE Movie(id INTEGER PRIMARY KEY, title TEXT, director TEXT, releaseDate TEXT, producer TEXT, plot TEXT, url TEXT);',
         );

         db.execute(
           'CREATE TABLE Character(id INTEGER PRIMARY KEY, birthDay TEXT, eyeColor TEXT, gender TEXT, hairColor TEXT, height TEXT, homeWorld TEXT, mass TEXT, name TEXT);',
         );

         db.execute(
           'CREATE TABLE movie_character_join(id INTEGER PRIMARY KEY, FOREIGN KEY (movie_id) REFERENCES Movie(id), FOREIGN KEY (character_id) REFERENCES Character(id));',
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
           url: maps[i]['url'] as String
       );

     });
   }


}