

class Movie {

  Movie(this.id, this.title, this.director, this.releaseDate, this.producer, this.plot, this.url);

  final int id;
  final String title;
  final String director;
  final String releaseDate;
  final String producer;
  final String plot;
  final String url;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'director': director,
      'releaseDate': releaseDate,
      'producer': producer,
      'plot': plot,
      'url': url
    };
  }
}