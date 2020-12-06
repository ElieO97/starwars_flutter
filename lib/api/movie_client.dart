


import 'package:star_wars_flutter/api/base_client.dart';
import 'package:star_wars_flutter/api/swapi.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/api/response/movies_response.dart';

class MovieClient extends BaseNetworkClient{

  MovieClient() : _swapi = Swapi(BaseNetworkClient.buildHttpAdapter());


  final Swapi _swapi;


  Future<MoviesResponse> fetchAllMovies() {
    return _swapi.fetchAllMovies();
  }


  Future<SwapiCharacter> fetchMovieCharacter(String id) async {
    return _swapi.fetchMovieCharacter(id);
  }

  Future<List<SwapiCharacter>> fetchMovieCharacters(List<String> ids) async {
    final List<SwapiCharacter> characters = <SwapiCharacter>[];

    for (final String id in ids) {
       final SwapiCharacter character =  await fetchMovieCharacter(id);
       characters.add(character);
    }

    return characters;
  }

}