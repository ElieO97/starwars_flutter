


import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/models/character.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';

class MovieDetailsBloc extends BlocBase {

  MovieDetailsBloc({this.movie, this.moviesRepository}) {
    init();
  }

  Future<void> init() async {
    final List<Character> characters = await moviesRepository.fetchMovieCharacters(movie.character);
    movie.character = characters.map((Character character) => character.name).toList();
    _streamController.add(movie);
  }

  //the internal object whose sink/stream we can use
  final BehaviorSubject<Movie> _streamController = BehaviorSubject<Movie>();
  MoviesRepository moviesRepository;

  //the stream of movie details. use this to show the details
  Stream<Movie> get stream => _streamController.stream;

  Movie movie;

  @override
  void dispose() {
    print('closing movie details streamcontroller');
    _streamController.close();
  }
}