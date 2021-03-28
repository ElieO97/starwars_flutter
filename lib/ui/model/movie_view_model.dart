import 'package:star_wars_flutter/ui/utils/star_wars_image_utils.dart';

/// Representation for a [MovieViewModel] fetched from an external layer data source
class MovieViewModel {
  MovieViewModel(
      {this.id,
      this.title,
      this.director,
      this.releaseDate,
      this.producer,
      this.plot,
      this.url,
      this.character,
      this.imdbRating});

  final int id;
  final String title;
  final String director;
  final String releaseDate;
  final String producer;
  final String plot;
  final String url;
  String character;
  double imdbRating;

  String getImagePath() {
    return findMovieImageAssetPath(title);
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, director: $director, releaseDate: $releaseDate, producer: $producer, plot: $plot, url: $url, character: $character, imdbRating: $imdbRating}';
  }
}
