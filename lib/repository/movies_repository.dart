

import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/api/movie_client.dart';
import 'package:star_wars_flutter/api/response/movies_response.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/db/database.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/utils/movie_utils.dart';

class MoviesRepository {

  final MovieClient _movieClient = MovieClient();
  final StarWarsDatabase _database = StarWarsDatabase.starWarsDatabase;

  Future<void> fetchAllMoviesFromApi() async {
    final MoviesResponse response =  await _movieClient.fetchAllMovies();
    final List<Movie> movies = response.results.map((SwapiMovie swapiMovie) => swapiMovie.toMovie()).toList();
    movies.forEach(_database.insertMovie);
  }

  Future<List<Movie>> fetchAllMovies() async {
     List<Movie> movies = await _database.getMovies();
     print('fetchAllMovies: movies = $movies');
     
     if (movies == null || movies.isEmpty) {
       await fetchAllMoviesFromApi();
       movies = await _database.getMovies();
     }

     return movies;
  }

  Future<List<SwapiCharacter>> fetchMovieCharacters(List<String> charactersUrls) async {
    return _movieClient.fetchMovieCharacters(MovieUtils.charatersUrlsToIds(charactersUrls));
  }
}