import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';

part 'swapi_movie_properties.g.dart';

@JsonSerializable()
class SwapiMovieProperties {
  SwapiMovieProperties(
      {required this.title,
      required this.director,
      required this.releaseDate,
      required this.producer,
      required this.characters,
      required this.id,
      required this.url,
      required this.plot});

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
  List<String> characters;

  @JsonKey(name: 'episode_id')
  int id;

  @JsonKey(name: 'url')
  String url;

  factory SwapiMovieProperties.fromJson(Map<String, dynamic> json) =>
      _$SwapiMoviePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SwapiMoviePropertiesToJson(this);

  MovieEntity toMovie() {
    print('toMovie: characters: $characters');
    return MovieEntity(
        id: id,
        title: title,
        director: director,
        releaseDate: releaseDate,
        producer: producer,
        plot: plot,
        url: url,
        characters: characters);
  }
}
