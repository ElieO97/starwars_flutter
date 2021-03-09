import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_flutter/remote/response/base_response.dart';
import 'package:star_wars_flutter/remote/response/movies_response.dart';

import 'constants/api_constants.dart';
import 'model/swapi_character.dart';

part 'swapi.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class Swapi {
  factory Swapi(Dio dio, {String baseUrl}) = _Swapi;

  static const String FILMS = 'films/';
  static const String PEOPLE = 'people/{id}';

  @GET(FILMS)
  Future<MoviesResponse> fetchAllMovies();

  @GET(PEOPLE)
  Future<BaseResponse<SwapiCharacter>> fetchMovieCharacter(@Path() String id);
}
