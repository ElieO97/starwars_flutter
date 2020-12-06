


import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/api/models/swapi_character.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/models/movie_details_state.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';

class MovieDetailsBloc extends BlocBase {

  MovieDetailsBloc({this.movie, this.moviesRepository}) {
    init();
  }

  Future<void> init() async {
    _streamController.addStream(fetchCharacters());
  }

  MovieDetailsState movieDetailsState = MovieDetailsLoading();
  BehaviorSubject<MovieDetailsState> _streamController = BehaviorSubject<MovieDetailsState>();
  MoviesRepository moviesRepository;
  SwapiMovie movie;

  Stream<MovieDetailsState> get stream {
    if (_streamController.isClosed) {
      print('stream closed, resetting it');
      _streamController = BehaviorSubject<MovieDetailsState>();
    }
    return _streamController.stream;
  }


  Stream<MovieDetailsState> fetchCharacters() async* {
    try  {
      final List<SwapiCharacter> characters = await moviesRepository.fetchMovieCharacters(movie.character);
      if (characters.isEmpty) {
        yield MovieDetailsEmpty();
      } else  {
        movie.character = characters.map((SwapiCharacter character) => character.name).toList();
        yield MovieDetailsPopulated(movie);
      }
    } catch (e) {
      print('error $e');
      yield MovieDetailsError(e.toString());
    }
  }

  @override
  void dispose() {
    _streamController.close();
  }
}