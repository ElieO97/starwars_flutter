import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_flutter/remote/response/omdb_movie_response.dart';

import 'constants/api_constants.dart';

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
