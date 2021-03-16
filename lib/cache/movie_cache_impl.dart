import 'package:star_wars_flutter/cache/db/database.dart';
import 'package:star_wars_flutter/cache/mapper/movie_entity_mapper.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_cache.dart';

class MovieCacheImpl implements MovieCache {
  MovieCacheImpl(this._database, this.entityMapper);

  final StarWarsDatabase _database;
  final MovieEntityMapper entityMapper;

  @override
  Future<List<MovieEntity>> fetchAllMovies() async {
    final List<CachedMovie> movies = await _database.getMovies();
    return movies
        .map((CachedMovie movie) => entityMapper.mapFromCached(movie))
        .toList();
  }

  @override
  Future<bool> isCached() async {
    final List<MovieEntity> movies = await fetchAllMovies();
    return movies != null && movies.isNotEmpty;
  }

  @override
  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveMovies(List<MovieEntity> movies) async {
    final List<CachedMovie> cachedMovies = movies
        .map((MovieEntity movieEntity) => entityMapper.mapToCached(movieEntity))
        .toList();
    cachedMovies.forEach(_database.insertMovie);
  }
}
