import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/presentation/mapper/mapper.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';

class MovieMapper implements Mapper<MovieViewModel, Movie> {
  @override
  MovieViewModel mapToViewModel(Movie type) {
    return MovieViewModel(
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
  Movie mapToModel(MovieViewModel type) {
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
}
