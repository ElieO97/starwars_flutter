import 'package:cache/db/starwars_database.dart';
import 'package:cache/mapper/character_entity_mapper.dart';
import 'package:cache/mapper/movie_entity_mapper.dart';
import 'package:cache/model/cached_character.dart';
import 'package:cache/model/cached_movie.dart';
import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';
import 'package:data/repository/movie_cache.dart';

class MovieCacheImpl implements MovieCache {
  MovieCacheImpl(this._database, this.entityMapper, this.characterEntityMapper);

  final StarWarsDatabase _database;
  final MovieEntityMapper entityMapper;
  final CharacterEntityMapper characterEntityMapper;

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
    return movies.isNotEmpty;
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

  @override
  Future<List<CharacterEntity>> fetchMovieCharacters(int movieId) async {
    final List<CachedCharacter> cachedCharacters =
        await _database.getCharactersForMovieId(movieId);

    return cachedCharacters
        .map((CachedCharacter character) =>
            characterEntityMapper.mapFromCached(character))
        .toList();
  }

  @override
  Future<bool> isCachedCharacters(int id) async {
    final List<CachedCharacter> movieCharacters =
        await _database.getCharactersForMovieId(id);

    return movieCharacters.isNotEmpty;
  }

  @override
  Future<void> saveCharacters(
      int movieId, List<CharacterEntity> characterEntities) async {
    for (final CharacterEntity character in characterEntities) {
      await _database.insertCharacter(
          movieId, characterEntityMapper.mapToCached(character));
    }
  }
}
