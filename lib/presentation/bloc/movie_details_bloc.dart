import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/presentation/model/movie_details_state.dart';
import 'package:star_wars_flutter/presentation/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/ui/utils/movie_utils.dart';

class MovieDetailsBloc extends BlocBase {
  MovieDetailsBloc({this.movie, this.moviesRepository}) {
    init();
  }

  Future<void> init() async {
    _streamController.addStream(fetchCharacters());
  }

  MovieDetailsState movieDetailsState = MovieDetailsLoading();
  BehaviorSubject<MovieDetailsState> _streamController =
      BehaviorSubject<MovieDetailsState>();
  MoviesRepository moviesRepository;
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
      final List<Character> characters =
          await moviesRepository.fetchMovieCharacters(movie.id, MovieUtils.charatersUrlsToIds(movie.character.split(',')));
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
