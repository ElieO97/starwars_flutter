import 'package:star_wars_flutter/cache/db/database.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/remote/model/swapi_character.dart';
import 'package:star_wars_flutter/remote/movie_client.dart';

class MoviesRepository {
  final MovieClient _movieClient = MovieClient();
  final StarWarsDatabase _database = StarWarsDatabase.starWarsDatabase;

  Future<void> fetchMovieCharactersFromApi(
      int movieId, List<String> charactersIds) async {
    final List<SwapiCharacter> swapiCharacters =
        await _movieClient.fetchMovieCharacters(charactersIds);
    final List<Character> characters = swapiCharacters
        .map((SwapiCharacter swapiCharacter) => swapiCharacter.toCharacter())
        .toList();

    for (final Character character in characters) {
      await _database.insertCharacter(movieId, character);
    }
  }

  Future<List<Character>> fetchMovieCharacters(
      int movieId, List<String> charactersIds) async {
    List<Character> movieCharacters =
        await _database.getCharacterWithMovieId(movieId);

    if (movieCharacters == null || movieCharacters.isEmpty) {
      await fetchMovieCharactersFromApi(movieId, charactersIds);
      movieCharacters = await _database.getCharacterWithMovieId(movieId);
    }

    return movieCharacters;
  }
}
