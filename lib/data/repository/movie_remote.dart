import 'package:star_wars_flutter/data/model/character_entity.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';

abstract class MovieRemote {
  Future<List<MovieEntity>> fetchAllMovies();

  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity);

  Future<List<CharacterEntity>> fetchMovieCharacters(
      int movieId, List<String> charactersIds);
}
