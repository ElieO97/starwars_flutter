import 'package:star_wars_flutter/data/model/character_entity.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_data_store.dart';
import 'package:star_wars_flutter/data/repository/movie_remote.dart';

class MovieRemoteDataStore implements MovieDataStore {
  MovieRemoteDataStore(this._movieRemote);

  final MovieRemote _movieRemote;

  @override
  Future<List<MovieEntity>> fetchAllMovies() {
    return _movieRemote.fetchAllMovies();
  }

  @override
  Future<void> clearMovies() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveMovies(List<MovieEntity> movies) {
    throw UnimplementedError();
  }

  @override
  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity) {
    return _movieRemote.fetchMovieRating(movieEntity);
  }

  @override
  Future<List<CharacterEntity>> fetchMovieCharacters(
      int movieId, List<String> charactersIds) {
    return _movieRemote.fetchMovieCharacters(movieId, charactersIds);
  }
}
