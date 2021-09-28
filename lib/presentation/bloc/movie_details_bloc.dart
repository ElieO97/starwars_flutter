import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/presentation/model/movie_details_state.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/utils/movie_utils.dart';

class MovieDetailsBloc extends Bloc<dynamic, MovieDetailsState> {
  MovieDetailsBloc({required this.movie, required this.getCharactersUseCase})
      : super(MovieDetailsLoading()) {
    init();
  }

  Future<void> init() async {
    _streamController.addStream(fetchCharacters());
  }

  MovieDetailsState movieDetailsState = MovieDetailsLoading();
  BehaviorSubject<MovieDetailsState> _streamController =
      BehaviorSubject<MovieDetailsState>();
  FutureUseCase<Map<int, List<String>>, List<Character>> getCharactersUseCase;
  MovieView movie;

  @override
  Stream<MovieDetailsState> get stream {
    if (_streamController.isClosed) {
      _streamController = BehaviorSubject<MovieDetailsState>();
    }
    return _streamController.stream;
  }

  Stream<MovieDetailsState> fetchCharacters() async* {
    try {
      final Map<int, List<String>> map = <int, List<String>>{};
      map[movie.id] = MovieUtils.charatersUrlsToIds(movie.characters);

      final List<Character> characters =
          await getCharactersUseCase.execute(map);
      if (characters.isEmpty) {
        yield MovieDetailsEmpty();
      } else {
        movie.characters =
            characters.map((Character character) => character.name).toList();
        yield MovieDetailsPopulated(movie, characters);
      }
    } catch (e) {
      yield MovieDetailsError(e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamController.close();
    return super.close();
  }
}
