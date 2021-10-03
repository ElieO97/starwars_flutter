import 'package:data/model/movie_entity.dart';
import 'package:remote/mapper/entity_mapper.dart';
import 'package:remote/model/swapi_movie_properties.dart';

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
      characters: type.characters,
    );
  }
}
