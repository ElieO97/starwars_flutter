


import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {


  MoviesResponse({this.results});
  List<SwapiMovie> results;


  bool get isEmpty => !hasResults();
  bool hasResults() {
    return results != null && results.isNotEmpty;
  }

  factory  MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}