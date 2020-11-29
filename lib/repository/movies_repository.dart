

import 'package:star_wars_flutter/api/movie_client.dart';
import 'package:star_wars_flutter/models/movies_response.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/utils/movie_utils.dart';

class MoviesRepository {

  final MovieClient _movieClient = MovieClient();

  Future<MoviesResponse> fetchAllMovies() async {
    return _movieClient.fetchAllMovies();
  }

  Future<List<Character>> fetchMovieCharacters(List<String> charactersUrls) async {
    return _movieClient.fetchMovieCharacters(MovieUtils.charatersUrlsToIds(charactersUrls));
  }
}