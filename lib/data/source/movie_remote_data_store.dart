import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_data_store.dart';
import 'package:star_wars_flutter/data/repository/movie_remote.dart';

class MovieRemoteDataStore implements MovieDataStore {
  MovieRemoteDataStore(this._movieRemote);

  final MovieRemote _movieRemote;

  @override
  Future<List<MovieEntity>> fetchAllMovies() {
    return _movieRemote.fetchAllMovies();
  }
}
