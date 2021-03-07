/// Representation for a [MovieView] instance for this layers Model representation
class MovieView {
  MovieView(
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