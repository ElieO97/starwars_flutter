import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/models/movie_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/utils/star_wars_image_utils.dart';


class MoviesBloc extends BlocBase {

  MoviesBloc(this.moviesRepository) {
    init();
  }

  MoviesRepository moviesRepository;
  MoviesPopulated moviesPopulated = MoviesPopulated(<Movie>[]);
  bool _hasNoExistingData() => moviesPopulated.movies?.isEmpty ?? true;


  BehaviorSubject<MoviesState> _streamController = BehaviorSubject<MoviesState>();


  Stream<MoviesState> get stream {
    if (_streamController.isClosed) {
      print('stream closed, resetting it');
      _streamController = BehaviorSubject<MoviesState>();
    }
    return _streamController.stream;
  }

  Stream<MoviesState> fetchMoviesFromNetwork() async* {
    if (_hasNoExistingData()) {
      yield MoviesLoading();
    }

    try  {
      final List<Movie> movies = await fetchAllMovies();
      debugPrint('fetchMovies: nuMovies = ${movies.length} $movies');
      if (movies.isEmpty && _hasNoExistingData()) {
        yield MoviesEmpty();
      } else  {
        yield  moviesPopulated.update(nuMovies: sortMoviesByReleaseDate(movies));
      }

    } catch (e) {
      print('error $e');
      yield MoviesError(e.toString());
    }
  }

  void init() {
    _streamController.addStream(fetchMoviesFromNetwork());
  }

  Future<List<Movie>> fetchAllMovies() {
    final Future<List<Movie>> movies = moviesRepository.fetchAllMovies();
    return movies;
  }

  @override
  void dispose() {
    print('close streamController');
    _streamController.close();
  }
}