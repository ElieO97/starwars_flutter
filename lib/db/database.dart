

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StarWarsDatabase {

   StarWarsDatabase._();

   static final StarWarsDatabase starWarsDatabased = StarWarsDatabase._();
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


}