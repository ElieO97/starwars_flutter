import 'package:data/model/character_entity.dart';
import 'package:data/model/movie_entity.dart';
import 'package:data/model/movie_rating_entity.dart';

abstract class MovieRemote {
  Future<List<MovieEntity>> getMovies();

  Future<MovieRatingEntity> getMovieRating(MovieEntity movieEntity);

  Future<List<CharacterEntity>> getMovieCharacters(
      int movieId, List<String> charactersIds);
}
