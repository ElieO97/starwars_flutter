import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/presentation/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/presentation/model/movie_state.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/utils/star_wars_image_utils.dart';

import 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(this.getMoviesUseCase, this.mapper) : super(MoviesLoading()) {
    add(GetMoviesEvent());
  }

  FutureUseCase<void, List<Movie>> getMoviesUseCase;
  MovieMapper mapper;
  MoviesPopulated moviesPopulated = MoviesPopulated(<MovieView>[]);

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
                  .map((Movie movie) => mapper.mapToView(movie))
                  .toList()));
        }
      }
    } catch (e) {
      yield MoviesError(e.toString());
    }
  }
}
