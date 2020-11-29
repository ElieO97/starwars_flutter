

import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/models/movie_state.dart';
import 'package:star_wars_flutter/models/movies_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/utils/star_wars_image_utils.dart';


class MoviesBloc extends BlocBase {

  MoviesBloc(this.moviesRepository) {
    init();
  }

  MoviesRepository moviesRepository;
  MoviesPopulated moviesPopulated = MoviesPopulated([]);
  bool _hasNoExistingData() => moviesPopulated.movies?.isEmpty ?? true;

  // This is the internal object whose stream/sink is provided by this component
  BehaviorSubject<MoviesState> _streamController = BehaviorSubject<MoviesState>();


  // This is the stream of movies. Use this to show the contents
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
      final MoviesResponse response = await fetchAllMovies();
      print('fetchMoviesFromNetwork: nuMovies = ${response.results}');
      if (response.isEmpty && _hasNoExistingData()) {
        yield MoviesEmpty();
      } else  {
        yield  moviesPopulated.update(nuMovies: sortMoviesByReleaseDate(response.results));
      }

    } catch (e) {
      print('error $e');
      yield MoviesError(e.toString());
    }
  }

  void init() {
    _streamController.addStream(fetchMoviesFromNetwork());
  }

  Future<MoviesResponse> fetchAllMovies() {
    final Future<MoviesResponse> apiCall = moviesRepository.fetchAllMovies();
    return apiCall;
  }

  @override
  void dispose() {
    print('close streamController');
    _streamController.close();
  }
}