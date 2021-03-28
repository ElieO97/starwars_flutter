/// Representation for a [MovieEntity] fetched from an external layer data source
class MovieEntity {
  MovieEntity(
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
}