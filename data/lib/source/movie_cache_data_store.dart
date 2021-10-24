import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';
import 'package:data/repository/movie_cache.dart';
import 'package:data/repository/movie_data_store.dart';

class MovieCacheDataStore implements MovieDataStore {
  MovieCacheDataStore(this._movieCache);

  final MovieCache _movieCache;

  @override
  Future<List<MovieEntity>> getMovies() {
    return _movieCache.getMovies();
  }

  @override
  Future<void> saveMovies(List<MovieEntity> movies) async {
    await _movieCache.saveMovies(movies);
  }

  @override
  Future<MovieRatingEntity> getMovieRating(MovieEntity movieEntity) {
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getMovieCharacters(
      int movieId, List<String> charactersIds) async {
    return await _movieCache.getMovieCharacters(movieId);
  }

  @override
  Future<void> saveCharacters(
      int movieId, List<CharacterEntity> characterEntities) async {
    await _movieCache.saveCharacters(movieId, characterEntities);
  }
}
