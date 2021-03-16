import 'package:star_wars_flutter/remote/mapper/character_entity_mapper.dart';
import 'package:star_wars_flutter/data/model/character_entity.dart';
import 'package:star_wars_flutter/data/model/movie_entity.dart';
import 'package:star_wars_flutter/data/model/movie_rating_entity.dart';
import 'package:star_wars_flutter/data/repository/movie_remote.dart';
import 'package:star_wars_flutter/remote/mapper/movie_entity_mapper.dart';
import 'package:star_wars_flutter/remote/mapper/movie_rating_entity_mapper.dart';
import 'package:star_wars_flutter/remote/model/omdb_movie_rating.dart';
import 'package:star_wars_flutter/remote/model/swapi_character.dart';
import 'package:star_wars_flutter/remote/movie_client.dart';
import 'package:star_wars_flutter/remote/response/movies_response.dart';
import 'model/swapi_movie.dart';

class MovieRemoteImpl implements MovieRemote {
  MovieRemoteImpl(this._movieClient, this._movieEntityMapper,
      this._movieRatingEntityMapper, this._characterEntityMapper);

  final MovieClient _movieClient;
  final MovieEntityMapper _movieEntityMapper;
  final MovieRatingEntityMapper _movieRatingEntityMapper;
  final CharacterEntityMapper _characterEntityMapper;

  @override
  Future<List<MovieEntity>> fetchAllMovies() async {
    final MoviesResponse response = await _movieClient.fetchAllMovies();
    final List<SwapiMovie> swapiMovies = response.result;

    final List<MovieEntity> movies = swapiMovies
        .map((SwapiMovie swapiMovie) =>
            _movieEntityMapper.mapFromRemote(swapiMovie.properties))
        .toList();

    return movies;
  }

  @override
  Future<MovieRatingEntity> fetchMovieRating(MovieEntity movieEntity) async {
    final OMDBMovieRating response =
        await _movieClient.fetchMovieRating(movieEntity.title);
    final MovieRatingEntity rating =
        _movieRatingEntityMapper.mapFromRemote(response);
    return rating;
  }

  @override
  Future<List<CharacterEntity>> fetchMovieCharacters(
      int movieId, List<String> charactersIds) async {
    final List<SwapiCharacter> swapiCharacters =
        await _movieClient.fetchMovieCharacters(charactersIds);

    final List<CharacterEntity> characters = swapiCharacters
        .map((SwapiCharacter character) =>
            _characterEntityMapper.mapFromRemote(character.properties))
        .toList();

    return characters;
  }
}
