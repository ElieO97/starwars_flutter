import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/models/movie.dart';

part 'swapi_movie.g.dart';

@JsonSerializable()
class SwapiMovie {

  SwapiMovie(
      this.title,
      this.director,
      this.releaseDate,
      this.producer,
      this.character,
      this.id,
      this.url
      );

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'director')
  String director;

  @JsonKey(name: 'release_date')
  String releaseDate;

  @JsonKey(name: 'producer')
  String producer;

  @JsonKey(name: 'opening_crawl')
  String plot;

  @JsonKey(name: 'characters')
  List<String> character;

  @JsonKey(name: 'episode_id')
  int id;

  @JsonKey(name: 'url')
  String url;



  factory SwapiMovie.fromJson(Map<String, dynamic> json) => _$SwapiMovieFromJson(json);
  Map<String, dynamic> toJson() => _$SwapiMovieToJson(this);


  Movie toMovie() {
    return Movie(
        id: id,
        title: title,
        director: director,
        releaseDate: releaseDate,
        producer: producer,
        plot: plot,
        url: url);
  }

  static List<Movie> toMovies(List<SwapiMovie> swapiMovies) {
    return swapiMovies.map((SwapiMovie swapiMovie) => swapiMovie.toMovie()).toList();

  }

  List<String> supportedWidgets() {
    return <String>['title', 'characters', 'plot'];
  }
}