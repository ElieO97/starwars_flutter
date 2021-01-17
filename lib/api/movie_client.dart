import 'package:star_wars_flutter/api/base_client.dart';
import 'package:star_wars_flutter/api/response/base_response.dart';
import 'package:star_wars_flutter/api/swapi.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';


import 'models/swapi_movie.dart';

class MovieClient extends BaseNetworkClient{

  MovieClient() : _swapi = Swapi(BaseNetworkClient.buildHttpAdapter());


  final Swapi _swapi;


  Future<BaseResponse<SwapiMovie>> fetchAllMovies() async {
    return _swapi.fetchAllMovies();
  }

  Future<BaseResponse<SwapiCharacter>> fetchMovieCharacter(String id) async {
    return _swapi.fetchMovieCharacter(id);
  }

  Future<List<SwapiCharacter>> fetchMovieCharacters(List<String> ids) async {
    final List<SwapiCharacter> characters = <SwapiCharacter>[];

    for (final String id in ids) {
       final SwapiCharacter character =  (await fetchMovieCharacter(id)).result ;
       print('SwapiCharacter = ${character.properties}');
       character.properties.id = id;
       characters.add(character);
    }

    return characters;
  }

}