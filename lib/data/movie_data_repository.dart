import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_data_store.dart';
import 'package:star_wars_flutter/data/source/movie_data_store_factory.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/domain/repository/movie_repository.dart';

import 'mapper/movie_mapper.dart';

class MoviesDataRepository implements MoviesRepository {
  MoviesDataRepository(this._factory, this._movieMapper);

  final MovieDataStoreFactory _factory;
  final MovieMapper _movieMapper;

  @override
  Future<List<Movie>> fetchAllMovies() async {
    final MovieDataStore dataStore = await _factory.retrieveDataStore();
    final List<MovieEntity> movies = await dataStore.fetchAllMovies();
    return movies
        .map((MovieEntity movieEntity) =>
            _movieMapper.mapFromEntity(movieEntity))
        .toList();
  }
}
