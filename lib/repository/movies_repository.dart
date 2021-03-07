import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/api/movie_client.dart';
import 'package:star_wars_flutter/api/response/movies_response.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/api/response/omdb_movie_response.dart';
import 'package:star_wars_flutter/db/database.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/utils/movie_utils.dart';

class MoviesRepository {
  final MovieClient _movieClient = MovieClient();
  final StarWarsDatabase _database = StarWarsDatabase.starWarsDatabase;

  Future<void> fetchAllMoviesFromApi() async {
    final MoviesResponse response = await _movieClient.fetchAllMovies();
    final List<SwapiMovie> swapiMovies = response.result;

    print('response = ${response.result}, swapiMovies = $swapiMovies');

    final List<Movie> movies = swapiMovies
        .map((SwapiMovie swapiMovie) => swapiMovie.toMovie())
        .toList();

    for (final Movie movie in movies) {
      final OMDBMovieResponse ratingResponse = await fetchMovieRating(movie);
      print('movie rating: ${ratingResponse.imdbRating}');

      if (ratingResponse.imdbRating.isNotEmpty &&
          ratingResponse.imdbRating != 'N/A') {
        movie.imdbRating = double.parse(ratingResponse.imdbRating);
      }
    }

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

  Future<void> fetchMovieCharactersFromApi(Movie movie) async {
    final List<SwapiCharacter> swapiCharacters =
        await _movieClient.fetchMovieCharacters(
            MovieUtils.charatersUrlsToIds(movie.character.split(',')));
    final List<Character> characters = swapiCharacters
        .map((SwapiCharacter swapiCharacter) => swapiCharacter.toCharacter())
        .toList();

    for (final Character character in characters) {
      await _database.insertCharacter(movie, character);
    }
  }

  Future<List<Character>> fetchMovieCharacters(Movie movie) async {
    List<Character> movieCharacters =
        await _database.getCharacterWithMovieId(movie);

    if (movieCharacters == null || movieCharacters.isEmpty) {
      await fetchMovieCharactersFromApi(movie);
      movieCharacters = await _database.getCharacterWithMovieId(movie);
    }

    return movieCharacters;
  }

  Future<OMDBMovieResponse> fetchMovieRating(Movie movie) async {
    return _movieClient.fetchMovieRating(movie.title);
  }
}
