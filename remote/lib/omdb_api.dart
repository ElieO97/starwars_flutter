import 'package:dio/dio.dart';
import 'package:remote/model/omdb_movie_rating.dart';
import 'package:retrofit/http.dart';

import 'constants/api_constants.dart';

part 'omdb_api.g.dart';

@RestApi(baseUrl: OMDB_BASE_URL)
abstract class OmdbApi {
  factory OmdbApi(Dio dio, {String baseUrl}) = _OmdbApi;

  static const String MOVIE = 't';
  static const String API_KEY = 'apikey';

  @GET('')
  Future<OMDBMovieRating> fetchMovie(
      @Query(API_KEY) String apiKey, @Query(MOVIE) String title);
}
