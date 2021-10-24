import 'package:data/mapper/character_mapper.dart';
import 'package:data/mapper/movie_mapper.dart';
import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';
import 'package:data/repository/movie_data_store.dart';
import 'package:data/source/movie_data_store_factory.dart';
import 'package:data/source/movie_remote_data_store.dart';
import 'package:domain/model/character.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';

class MoviesDataRepository implements MoviesRepository {
  MoviesDataRepository(this._factory, this._movieMapper, this._characterMapper);

  final MovieDataStoreFactory _factory;
  final MovieMapper _movieMapper;
  final CharacterMapper _characterMapper;

  @override
  Future<List<Movie>> getMovies() async {
    final MovieDataStore dataStore = await _factory.retrieveDataStore();
    final List<MovieEntity> movies = await dataStore.getMovies();

    if (dataStore is MovieRemoteDataStore) {
      for (final MovieEntity movie in movies) {
        final MovieRatingEntity movieRating =
            await dataStore.getMovieRating(movie);

        if (movieRating.rating.isNotEmpty && movieRating.rating != 'N/A') {
          movie.imdbRating = double.parse(movieRating.rating);
        }
      }

      await _factory.retrieveCachedDataStore().saveMovies(movies);
    }

    return movies
        .map((MovieEntity movieEntity) =>
            _movieMapper.mapFromEntity(movieEntity))
        .toList();
  }

  @override
  Future<List<Character>> getMovieCharacters(
      int movieId, List<String> charactersIds) async {
    final MovieDataStore dataStore =
        await _factory.retrieveDataStore(id: movieId);

    final List<CharacterEntity> characters =
        await dataStore.getMovieCharacters(movieId, charactersIds);

    if (dataStore is MovieRemoteDataStore) {
      await _factory
          .retrieveCachedDataStore()
          .saveCharacters(movieId, characters);
    }

    return characters
        .map((CharacterEntity characterEntity) =>
            _characterMapper.mapFromEntity(characterEntity))
        .toList();
  }
}
