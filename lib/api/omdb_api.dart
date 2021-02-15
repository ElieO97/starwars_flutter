import 'package:retrofit/http.dart';
import 'package:star_wars_flutter/api/response/omdb_movie_response.dart';
import 'package:star_wars_flutter/constants/api_constants.dart';
import 'package:dio/dio.dart';

part 'omdb_api.g.dart';

@RestApi(baseUrl: OMDB_BASE_URL)
abstract class OmdbApi {
  factory OmdbApi(Dio dio, {String baseUrl}) = _OmdbApi;

  static const String MOVIE = 't';
  static const String API_KEY = 'apikey';

  @GET('')
  Future<OMDBMovieResponse> fetchMovie(
      @Query(API_KEY) String apiKey, @Query(MOVIE) String title);
}
