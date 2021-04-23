import 'package:star_wars_flutter/data/mapper/mapper.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';

/// Map a [MovieEntity] to and from a [Movie] instance when data is moving between
/// this layer and the Domain layer
class MovieMapper implements Mapper<MovieEntity, Movie> {
  @override
  Movie mapFromEntity(MovieEntity type) {
    return Movie(
        id: type.id,
        title: type.title,
        director: type.director,
        releaseDate: type.releaseDate,
        producer: type.producer,
        plot: type.plot,
        url: type.url,
        characters: type.characters,
        imdbRating: type.imdbRating);
  }

  @override
  MovieEntity mapToEntity(Movie type) {
    return MovieEntity(
        id: type.id,
        title: type.title,
        director: type.director,
        releaseDate: type.releaseDate,
        producer: type.producer,
        plot: type.plot,
        url: type.url,
        characters: type.characters,
        imdbRating: type.imdbRating);
  }
}
