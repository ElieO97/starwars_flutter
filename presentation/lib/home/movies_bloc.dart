import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/interactor/future_use_case.dart';
import 'package:domain/model/movie.dart';
import 'package:presentation/mapper/movie_mapper.dart';
import 'package:presentation/home/movies_state.dart';
import 'package:presentation/model/movie_view_model.dart';
import 'package:presentation/utils/star_wars_image_utils.dart';

import 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(this.getMoviesUseCase, this.mapper) : super(MoviesLoading()) {
    add(GetMoviesEvent());
  }

  FutureUseCase<void, List<Movie>> getMoviesUseCase;
  MovieMapper mapper;
  MoviesPopulated moviesPopulated = MoviesPopulated(<MovieViewModel>[]);

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    try {
      if (event is GetMoviesEvent) {
        final List<Movie> movies = await getMoviesUseCase.execute(null);
        if (movies.isEmpty) {
          yield MoviesEmpty();
        } else {
          yield moviesPopulated.update(
              nuMovies: sortMoviesByReleaseDate(movies
                  .map((Movie movie) => mapper.mapToViewModel(movie))
                  .toList()));
        }
      }
    } catch (e) {
      yield MoviesError(e.toString());
    }
  }
}
