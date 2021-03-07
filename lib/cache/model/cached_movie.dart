/// Model used solely for the caching of a Movie

class CachedMovie {
  CachedMovie(
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
