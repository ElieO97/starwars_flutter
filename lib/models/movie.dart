


import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/utils/star_wars_image_utils.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
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

  Movie(
      this.title,
      this.director,
      this.releaseDate,
      this.producer,
      this.character,
      this.id,
      this.url
      );


  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);


  String getImagePath() {
    return findMovieImageAssetPath(title);
  }


  List<String> supportedWidgets() {
    return <String>['title', 'characters', 'plot'];
  }
}