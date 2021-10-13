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
  Future<List<Movie>> fetchAllMovies() async {
    final MovieDataStore dataStore = await _factory.retrieveDataStore();
    final List<MovieEntity> movies = await dataStore.fetchAllMovies();

    if (dataStore is MovieRemoteDataStore) {
      for (final MovieEntity movie in movies) {
        final MovieRatingEntity movieRating =
            await dataStore.fetchMovieRating(movie);
        print('movie rating: ${movieRating.rating}');

        if (movieRating.rating.isNotEmpty && movieRating.rating != 'N/A') {
          movie.imdbRating = double.parse(movieRating.rating);
        }
      }

      await _saveMoviesEntities(movies);
    }

    return movies
        .map((MovieEntity movieEntity) =>
            _movieMapper.mapFromEntity(movieEntity))
        .toList();
  }

  @override
  Future<void> clearMovies() async {}

  @override
  Future<void> saveMovies(List<Movie> movies) {
    final List<MovieEntity> movieEntities =
        movies.map((Movie movie) => _movieMapper.mapToEntity(movie)).toList();
    return _saveMoviesEntities(movieEntities);
  }

  Future<void> _saveMoviesEntities(List<MovieEntity> movies) {
    return _factory.retrieveCachedDataStore().saveMovies(movies);
  }

  Future<void> _saveCharactersEntities(
      int movieId, List<CharacterEntity> characters) {
    return _factory
        .retrieveCachedDataStore()
        .saveCharacters(movieId, characters);
  }

  @override
  Future<List<Character>> fetchMovieCharacters(
      int movieId, List<String> charactersIds) async {
    final MovieDataStore dataStore =
        await _factory.retrieveDataStore(id: movieId);

    print('fetchMovieCharacters: DataStore = $dataStore');

    final List<CharacterEntity> characters =
        await dataStore.fetchMovieCharacters(movieId, charactersIds);

    if (dataStore is MovieRemoteDataStore) {
      await _saveCharactersEntities(movieId, characters);
    }

    return characters
        .map((CharacterEntity characterEntity) =>
            _characterMapper.mapFromEntity(characterEntity))
        .toList();
  }
}