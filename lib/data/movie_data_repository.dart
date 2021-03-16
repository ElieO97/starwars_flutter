import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_data_store.dart';
import 'package:star_wars_flutter/data/source/movie_data_store_factory.dart';
import 'package:star_wars_flutter/data/source/movie_remote_data_store.dart';
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
  Future<void> clearMovies() {}

  @override
  Future<void> saveMovies(List<Movie> movies) {
    final List<MovieEntity> movieEntities =
        movies.map((Movie movie) => _movieMapper.mapToEntity(movie)).toList();
    return _saveMoviesEntities(movieEntities);
  }

  Future<void> _saveMoviesEntities(List<MovieEntity> movies) {
    return _factory.retrieveCachedDataStore().saveMovies(movies);
  }
}
