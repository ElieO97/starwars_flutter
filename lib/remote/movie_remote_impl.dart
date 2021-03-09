import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_remote.dart';
import 'package:star_wars_flutter/remote/mapper/movie_entity_mapper.dart';
import 'package:star_wars_flutter/remote/movie_client.dart';
import 'package:star_wars_flutter/remote/response/movies_response.dart';

import 'model/swapi_movie.dart';

class MovieRemoteImpl implements MovieRemote {
  MovieRemoteImpl(this._movieClient, this._entityMapper);

  final MovieClient _movieClient;
  final MovieEntityMapper _entityMapper;

  @override
  Future<List<MovieEntity>> fetchAllMovies() async {
    final MoviesResponse response = await _movieClient.fetchAllMovies();
    final List<SwapiMovie> swapiMovies = response.result;

    final List<MovieEntity> movies = swapiMovies
        .map((SwapiMovie swapiMovie) =>
            _entityMapper.mapFromRemote(swapiMovie.properties))
        .toList();

    return movies;
  }
}
