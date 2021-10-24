import 'package:dio/dio.dart';
import 'package:remote/response/characters_response.dart';
import 'package:remote/response/movies_response.dart';
import 'package:retrofit/http.dart';

import 'constants/api_constants.dart';

part 'swapi.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class Swapi {
  factory Swapi(Dio dio, {String baseUrl}) = _Swapi;

  static const String FILMS = 'films/';
  static const String PEOPLE = 'people/{id}';

  @GET(FILMS)
  Future<MoviesResponse> fetchAllMovies();

  @GET(PEOPLE)
  Future<CharactersResponse> fetchMovieCharacter(@Path() String id);
}
