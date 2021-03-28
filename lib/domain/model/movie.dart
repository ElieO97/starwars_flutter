class Movie {
  Movie(
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

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, director: $director, releaseDate: $releaseDate, producer: $producer, plot: $plot, url: $url, character: $character, imdbRating: $imdbRating}';
  }
}
