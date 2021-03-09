import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/remote/model/swapi_movie.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  MoviesResponse({this.result});

  List<SwapiMovie> result;

  bool get isEmpty => !hasResults();

  bool hasResults() {
    return result != null && result.isNotEmpty;
  }

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
