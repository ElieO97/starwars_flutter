


import 'package:star_wars_flutter/api/base_client.dart';
import 'package:star_wars_flutter/api/swapi.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/models/movies_response.dart';

class MovieClient extends BaseNetworkClient{

  MovieClient() : _swapi = Swapi(BaseNetworkClient.buildHttpAdapter());


  final Swapi _swapi;


  Future<MoviesResponse> fetchAllMovies() {
    return _swapi.fetchAllMovies();
  }


  Future<Character> fetchMovieCharacter(String id) async {
    return _swapi.fetchMovieCharacter(id);
  }

  Future<List<Character>> fetchMovieCharacters(List<String> ids) async {
    final List<Character> characters = <Character>[];

    for (final String id in ids) {
       final Character character =  await fetchMovieCharacter(id);
       characters.add(character);
    }

    return characters;
  }

}