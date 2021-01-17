import 'package:retrofit/http.dart';
import 'package:star_wars_flutter/api/response/base_response.dart';
import 'package:star_wars_flutter/constants/api_constants.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/api/response/movies_response.dart';
import 'package:dio/dio.dart';
import 'models/swapi_movie.dart';

part 'swapi.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class Swapi {

   factory Swapi(Dio dio, {String baseUrl}) = _Swapi;

   static const String FILMS = 'films/';
   static const String PEOPLE = 'people/{id}';

   @GET(FILMS)
   Future<BaseResponse<SwapiMovie>> fetchAllMovies();

   @GET(PEOPLE)
   Future<BaseResponse<SwapiCharacter>> fetchMovieCharacter(@Path() String id);

}