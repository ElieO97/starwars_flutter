import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/mapper/mapper.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';

class MovieMapper implements Mapper<MovieViewModel, MovieView> {
  @override
  MovieViewModel mapToViewModel(MovieView type) {
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
  MovieView mapToView(MovieViewModel type) {
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
