/// Representation for a [MovieEntity] fetched from an external layer data source
class MovieEntity {
  MovieEntity(
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
}
