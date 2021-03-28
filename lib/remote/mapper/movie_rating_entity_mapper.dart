import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';
import 'package:star_wars_flutter/remote/mapper/entity_mapper.dart';
import 'package:star_wars_flutter/remote/model/omdb_movie_rating.dart';

class MovieRatingEntityMapper
    implements EntityMapper<OMDBMovieRating, MovieRatingEntity> {
  @override
  MovieRatingEntity mapFromRemote(OMDBMovieRating type) {
    return MovieRatingEntity(type.imdbRating);
  }
}
