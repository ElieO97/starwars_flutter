/// Model used solely for the caching of a Movie
import 'package:hive/hive.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';

part 'cached_movie.g.dart';

@HiveType(typeId: 1)
class CachedMovie extends HiveObject {
  CachedMovie(
      {required this.id,
      required this.title,
      required this.director,
      required this.releaseDate,
      required this.producer,
      required this.plot,
      required this.url,
      this.imdbRating});

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String director;
  @HiveField(3)
  final String releaseDate;
  @HiveField(4)
  final String producer;
  @HiveField(5)
  final String plot;
  @HiveField(6)
  final String url;
  @HiveField(7)
  HiveList characters;
  @HiveField(8)
  double? imdbRating;
}
