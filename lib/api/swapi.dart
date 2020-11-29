
import 'package:retrofit/http.dart';
import 'package:star_wars_flutter/constants/api_constants.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/models/movies_response.dart';
import 'package:dio/dio.dart';

part 'swapi.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class Swapi {

   factory Swapi(Dio dio, {String baseUrl}) = _Swapi;

   static const String FILMS = 'films/';
   static const String PEOPLE = 'people/{id}';

   @GET(FILMS)
   Future<MoviesResponse> fetchAllMovies();

   @GET(PEOPLE)
   Future<Character> fetchMovieCharacter(@Path() String id);

}