

import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/api/movie_client.dart';
import 'package:star_wars_flutter/api/response/movies_response.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/db/database.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/utils/movie_utils.dart';

class MoviesRepository {

  final MovieClient _movieClient = MovieClient();
  final StarWarsDatabase _database = StarWarsDatabase.starWarsDatabase;

  Future<void> fetchAllMoviesFromApi() async {
    final MoviesResponse response =  await _movieClient.fetchAllMovies();
    final List<SwapiMovie> swapiMovies = response.results;
    final List<Movie> movies = swapiMovies.map((SwapiMovie swapiMovie) => swapiMovie.toMovie()).toList();
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

  Future<void> fetchMovieCharactersFromApi(Movie movie, List<String> charactersUrls) async {
    final List<SwapiCharacter> swapiCharacters = await _movieClient.fetchMovieCharacters(MovieUtils.charatersUrlsToIds(charactersUrls));
    final List<Character> characters = swapiCharacters.map((SwapiCharacter swapiCharacter) => swapiCharacter.toCharacter()).toList();
    characters.forEach(_database.insertCharacter);
  }

  Future<List<Character>> fetchMovieCharacters(Movie movie, List<String> charactersUrls) async {
    List<Character> movieCharacters = await _database.getCharacterWithMovieId(movie.id);

    if (movieCharacters == null || movieCharacters.isEmpty) {
      await fetchMovieCharactersFromApi(movie, charactersUrls);
      movieCharacters = await _database.getCharacterWithMovieId(movie.id);
    }

    return movieCharacters;
  }
}