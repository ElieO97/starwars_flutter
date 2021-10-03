import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';

abstract class MovieDataStore {
  Future<List<MovieEntity>> fetchAllMovies();

  Future<void> saveMovies(List<MovieEntity> movies);

  Future<void> saveCharacters(
      int movieId, List<CharacterEntity> characterEntities);

  Future<void> clearMovies();

  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity);

  Future<List<CharacterEntity>> fetchMovieCharacters(
      int movieId, List<String> charactersIds);
}
