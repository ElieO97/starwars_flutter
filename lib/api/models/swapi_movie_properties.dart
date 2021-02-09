
import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/models/movie.dart';

part 'swapi_movie_properties.g.dart';

@JsonSerializable()
class SwapiMovieProperties {

  SwapiMovieProperties(
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



  factory SwapiMovieProperties.fromJson(Map<String, dynamic> json) => _$SwapiMoviePropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$SwapiMoviePropertiesToJson(this);

  Movie toMovie() {
    print('toMovie: characters: $character');
    return Movie(
        id: id,
        title: title,
        director: director,
        releaseDate: releaseDate,
        producer: producer,
        plot: plot,
        url: url,
        character: character.join(','));
  }
}