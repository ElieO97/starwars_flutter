import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';

abstract class MovieDataStore {
  Future<List<MovieEntity>> getMovies();

  Future<void> saveMovies(List<MovieEntity> movies);

  Future<void> saveCharacters(
      int movieId, List<CharacterEntity> characterEntities);

  Future<MovieRatingEntity> getMovieRating(MovieEntity movieEntity);

  Future<List<CharacterEntity>> getMovieCharacters(
      int movieId, List<String> charactersIds);
}
