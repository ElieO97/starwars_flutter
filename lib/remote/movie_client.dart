import 'package:star_wars_flutter/remote/base_client.dart';
import 'package:star_wars_flutter/remote/model/swapi_character.dart';
import 'package:star_wars_flutter/remote/omdb_api.dart';
import 'package:star_wars_flutter/remote/response/base_response.dart';
import 'package:star_wars_flutter/remote/response/movies_response.dart';
import 'package:star_wars_flutter/remote/response/omdb_movie_response.dart';
import 'package:star_wars_flutter/remote/swapi.dart';

import 'constants/api_constants.dart';

class MovieClient extends BaseNetworkClient {
  MovieClient()
      : _swapi = Swapi(BaseNetworkClient.buildHttpAdapter()),
        _omdbApi = OmdbApi(BaseNetworkClient.buildHttpAdapter());

  final Swapi _swapi;
  final OmdbApi _omdbApi;

  Future<MoviesResponse> fetchAllMovies() async {
    MoviesResponse response = await _swapi.fetchAllMovies();
    print('MoviesResponse  = ${response.result}');
    return response;
  }

  Future<BaseResponse<SwapiCharacter>> fetchMovieCharacter(String id) async {
    return _swapi.fetchMovieCharacter(id);
  }

  Future<List<SwapiCharacter>> fetchMovieCharacters(List<String> ids) async {
    final List<SwapiCharacter> characters = <SwapiCharacter>[];

    for (final String id in ids) {
      final SwapiCharacter character = (await fetchMovieCharacter(id)).result;
      print('SwapiCharacter = ${character.properties}');
      character.properties.id = id;
      characters.add(character);
    }

    print('SwapiCharacters = $characters');
    return characters;
  }

  Future<OMDBMovieResponse> fetchMovieRating(String title) {
    return _omdbApi.fetchMovie(OMDB_API_KEY, title);
  }
}
