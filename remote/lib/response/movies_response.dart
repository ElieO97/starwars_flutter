import 'package:json_annotation/json_annotation.dart';
import 'package:remote/model/swapi_movie.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  MoviesResponse({required this.result});

  List<SwapiMovie> result;

  bool get isEmpty => !hasResults();

  bool hasResults() {
    return result.isNotEmpty;
  }

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
