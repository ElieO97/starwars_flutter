import 'package:json_annotation/json_annotation.dart';

part 'omdb_movie_response.g.dart';

@JsonSerializable()
class OMDBMovieResponse {
  OMDBMovieResponse(this.imdbRating);

  final String imdbRating;

  factory OMDBMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$OMDBMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OMDBMovieResponseToJson(this);
}
