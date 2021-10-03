import 'package:json_annotation/json_annotation.dart';

part 'omdb_movie_rating.g.dart';

@JsonSerializable()
class OMDBMovieRating {
  OMDBMovieRating(this.imdbRating);

  final String imdbRating;

  factory OMDBMovieRating.fromJson(Map<String, dynamic> json) =>
      _$OMDBMovieRatingFromJson(json);

  Map<String, dynamic> toJson() => _$OMDBMovieRatingToJson(this);
}
