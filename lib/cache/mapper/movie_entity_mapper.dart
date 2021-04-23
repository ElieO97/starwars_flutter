import 'package:star_wars_flutter/cache/mapper/entity_mapper.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:star_wars_flutter/cache/model/cached_movie.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:hive/hive.dart';

/// Map a [CachedMovie] instance to and from a [MovieEntity] instance when data is moving between
/// this later and the Data layer

class MovieEntityMapper implements EntityMapper<CachedMovie, MovieEntity> {
  /// Map a [CachedMovie] instance to a [MovieEntity] instance
  @override
  MovieEntity mapFromCached(CachedMovie type) {
    final HiveList<CachedCharacter> charactersList =
        type.characters.castHiveList<CachedCharacter>();
    return MovieEntity(
        id: type.id,
        title: type.title,
        director: type.director,
        releaseDate: type.releaseDate,
        producer: type.producer,
        plot: type.plot,
        url: type.url,
        characters: charactersList.map((CachedCharacter e) => e.url).toList(),
        imdbRating: type.imdbRating);
  }

  /// Map a [MovieEntity] instance to a [CachedMovie] instance
  @override
  CachedMovie mapToCached(MovieEntity type) {
    throw UnimplementedError();
  }
}
