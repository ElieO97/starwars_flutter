

import 'package:star_wars_flutter/api/swapi.dart';
import 'package:star_wars_flutter/models/movies_response.dart';

class MoviesRepository {

  final Swapi swapi = Swapi();



  Future<MoviesResponse> fetchAllMovies() async {
    return swapi.fetchAllMovies();

  }
}