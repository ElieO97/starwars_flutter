import 'package:presentation/utils/star_wars_image_utils.dart';

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
  final List<String> characters;
  final double? imdbRating;

  String? getImagePath() {
    return findMovieImageAssetPath(title);
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, director: $director, releaseDate: $releaseDate, producer: $producer, plot: $plot, url: $url, characters: $characters, imdbRating: $imdbRating}';
  }

  MovieViewModel copyWith(
      {int? id,
      String? title,
      String? director,
      String? releaseDate,
      String? producer,
      String? plot,
      String? url,
      List<String>? characters,
      double? imdbRating}) {
    return MovieViewModel(
        id: id ?? this.id,
        title: title ?? this.title,
        director: director ?? this.director,
        releaseDate: releaseDate ?? this.releaseDate,
        producer: producer ?? this.producer,
        plot: plot ?? this.plot,
        url: url ?? this.url,
        characters: characters ?? this.characters,
        imdbRating: imdbRating ?? this.imdbRating);
  }
}
