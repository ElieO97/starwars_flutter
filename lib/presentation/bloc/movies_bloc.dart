import 'package:flutter/material.dart';
import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/presentation/model/movie_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/presentation/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/presentation/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/utils/star_wars_image_utils.dart';

class MoviesBloc extends BlocBase {
  MoviesBloc(this.getMoviesUseCase, this.mapper) {
    init();
  }

  FutureUseCase<void, List<Movie>> getMoviesUseCase;
  MovieMapper mapper;
  MoviesPopulated moviesPopulated = MoviesPopulated(<MovieView>[]);

  bool _hasNoExistingData() => moviesPopulated.movies?.isEmpty ?? true;

  BehaviorSubject<MoviesState> _streamController =
      BehaviorSubject<MoviesState>();

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

    try {
      final List<Movie> movies = await fetchAllMovies();
      debugPrint('fetchMovies: nuMovies = ${movies.length} $movies');
      if (movies.isEmpty && _hasNoExistingData()) {
        yield MoviesEmpty();
      } else {
        yield moviesPopulated.update(
            nuMovies: sortMoviesByReleaseDate(
                movies.map((Movie movie) => mapper.mapToView(movie)).toList()));
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
    final Future<List<Movie>> movies = getMoviesUseCase.execute(null);
    return movies;
  }

  @override
  void dispose() {
    print('close streamController');
    _streamController.close();
  }
}
