/// Model used solely for the caching of a Movie

class CachedMovie {
  CachedMovie(
      {required this.id,
      required this.title,
      required this.director,
      required this.releaseDate,
      required this.producer,
      required this.plot,
      required this.url,
      required this.character,
      this.imdbRating});

  final int id;
  final String title;
  final String director;
  final String releaseDate;
  final String producer;
  final String plot;
  final String url;
  String character;
  double? imdbRating;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'director': director,
      'releaseDate': releaseDate,
      'producer': producer,
      'plot': plot,
      'url': url,
      'character': character,
      'imdbRating': imdbRating
    };
  }
}
