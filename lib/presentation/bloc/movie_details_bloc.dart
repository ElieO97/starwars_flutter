import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/presentation/model/movie_details_state.dart';
import 'package:star_wars_flutter/presentation/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/utils/movie_utils.dart';

class MovieDetailsBloc extends BlocBase {
  MovieDetailsBloc({required this.movie, required this.getCharactersUseCase}) {
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

  Stream<MovieDetailsState> get stream {
    if (_streamController.isClosed) {
      print('stream closed, resetting it');
      _streamController = BehaviorSubject<MovieDetailsState>();
    }
    return _streamController.stream;
  }

  Stream<MovieDetailsState> fetchCharacters() async* {
    try {
      final Map<int, List<String>> map = <int, List<String>>{};
      map[movie.id] = MovieUtils.charatersUrlsToIds(movie.character.split(','));

      print('fetchCharacters called');

      final List<Character> characters =
          await getCharactersUseCase.execute(map);
      if (characters.isEmpty) {
        yield MovieDetailsEmpty();
      } else {
        movie.character =
            characters.map((Character character) => character.name).join(',');
        yield MovieDetailsPopulated(movie, characters);
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
