import 'package:star_wars_flutter/presentation/utils/star_wars_image_utils.dart';

/// Representation for a [MovieViewModel] fetched from an external layer data source
class MovieViewModel {
  MovieViewModel(
      {required this.id,
      required this.title,
      required this.director,
      required this.releaseDate,
      required this.producer,
      required this.plot,
      required this.url,
      required this.characters,
      this.imdbRating});

  final int id;
  final String title;
  final String director;
  final String releaseDate;
  final String producer;
  final String plot;
  final String url;
  List<String> characters;
  double? imdbRating;

  String? getImagePath() {
    return findMovieImageAssetPath(title);
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, director: $director, releaseDate: $releaseDate, producer: $producer, plot: $plot, url: $url, characters: $characters, imdbRating: $imdbRating}';
  }
}
