import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/presentation/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/presentation/model/movie_state.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/utils/star_wars_image_utils.dart';

class MoviesBloc extends Bloc<dynamic, MoviesState> {
  MoviesBloc(this.getMoviesUseCase, this.mapper)
      : super(MoviesPopulated(<MovieView>[])) {
    init();
  }

  FutureUseCase<void, List<Movie>> getMoviesUseCase;
  MovieMapper mapper;
  MoviesPopulated moviesPopulated = MoviesPopulated(<MovieView>[]);

  bool _hasNoExistingData() => moviesPopulated.movies.isEmpty;

  BehaviorSubject<MoviesState> _streamController =
      BehaviorSubject<MoviesState>();

  @override
  Stream<MoviesState> get stream {
    if (_streamController.isClosed) {
      _streamController = BehaviorSubject<MoviesState>();
    }
    return _streamController.stream;
  }

  Stream<MoviesState> fetchMovies() async* {
    if (_hasNoExistingData()) {
      yield MoviesLoading();
    }

    try {
      final List<Movie> movies = await getMoviesUseCase.execute(null);
      if (movies.isEmpty && _hasNoExistingData()) {
        yield MoviesEmpty();
      } else {
        yield moviesPopulated.update(
            nuMovies: sortMoviesByReleaseDate(
                movies.map((Movie movie) => mapper.mapToView(movie)).toList()));
      }
    } catch (e) {
      yield MoviesError(e.toString());
    }
  }

  void init() {
    _streamController.addStream(fetchMovies());
  }

  @override
  Future<void> close() {
    _streamController.close();
    return super.close();
  }

  @override
  Stream<MoviesState> mapEventToState(dynamic event) async* {
    if (_hasNoExistingData()) {
      yield MoviesLoading();
    }

    try {
      final List<Movie> movies = await getMoviesUseCase.execute(null);
      if (movies.isEmpty && _hasNoExistingData()) {
        yield MoviesEmpty();
      } else {
        yield moviesPopulated.update(
            nuMovies: sortMoviesByReleaseDate(
                movies.map((Movie movie) => mapper.mapToView(movie)).toList()));
      }
    } catch (e) {
      yield MoviesError(e.toString());
    }
  }
}
