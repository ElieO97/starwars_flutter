import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/remote/mapper/entity_mapper.dart';
import 'package:star_wars_flutter/remote/model/swapi_movie_properties.dart';

class MovieEntityMapper
    implements EntityMapper<SwapiMovieProperties, MovieEntity> {
  @override
  MovieEntity mapFromRemote(SwapiMovieProperties type) {
    return MovieEntity(
      id: type.id,
      title: type.title,
      director: type.director,
      releaseDate: type.releaseDate,
      producer: type.producer,
      plot: type.plot,
      url: type.url,
      character: type.character.join(','),
    );
  }
}
