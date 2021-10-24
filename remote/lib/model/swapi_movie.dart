import 'package:data/model/movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote/model/swapi_movie_properties.dart';

part 'swapi_movie.g.dart';

@JsonSerializable()
class SwapiMovie {
  SwapiMovie(
    this.properties,
  );

  SwapiMovieProperties properties;

  factory SwapiMovie.fromJson(Map<String, dynamic> json) =>
      _$SwapiMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SwapiMovieToJson(this);

  MovieEntity toMovie() {
    return properties.toMovie();
  }
}
