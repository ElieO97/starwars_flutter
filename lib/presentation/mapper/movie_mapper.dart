import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/presentation/mapper/mapper.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';

class MovieMapper implements Mapper<MovieView, Movie> {
  @override
  MovieView mapToView(Movie type) {
    return MovieView(
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
