import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/presentation/model/movie_details_state.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';
import 'package:star_wars_flutter/ui/utils/movie_utils.dart';

import 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required this.movie, required this.getCharactersUseCase})
      : super(MovieDetailsLoading()) {
    add(GetMovieDetailsEvent());
  }

  FutureUseCase<Map<int, List<String>>, List<Character>> getCharactersUseCase;
  MovieViewModel movie;

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
    try {
      if (event is GetMovieDetailsEvent) {
        final Map<int, List<String>> map = <int, List<String>>{};
        map[movie.id] = MovieUtils.charatersUrlsToIds(movie.characters);

        final List<Character> characters =
            await getCharactersUseCase.execute(map);
        if (characters.isEmpty) {
          yield MovieDetailsEmpty();
        } else {
          movie.characters =
              characters.map((Character character) => character.name).toList();
          yield MovieDetailsPopulated(movie);
        }
      }
    } catch (e) {
      yield MovieDetailsError(e.toString());
    }
  }
}
