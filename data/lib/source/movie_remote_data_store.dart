import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';
import 'package:data/repository/movie_data_store.dart';
import 'package:data/repository/movie_remote.dart';

class MovieRemoteDataStore implements MovieDataStore {
  MovieRemoteDataStore(this._movieRemote);

  final MovieRemote _movieRemote;

  @override
  Future<List<MovieEntity>> getMovies() {
    return _movieRemote.getMovies();
  }

  @override
  Future<void> saveMovies(List<MovieEntity> movies) {
    throw UnimplementedError();
  }

  @override
  Future<MovieRatingEntity> getMovieRating(MovieEntity movieEntity) {
    return _movieRemote.getMovieRating(movieEntity);
  }

  @override
  Future<List<CharacterEntity>> getMovieCharacters(
      int movieId, List<String> charactersIds) {
    return _movieRemote.getMovieCharacters(movieId, charactersIds);
  }

  @override
  Future<void> saveCharacters(
      int movieId, List<CharacterEntity> characterEntities) {
    throw UnimplementedError();
  }
}
