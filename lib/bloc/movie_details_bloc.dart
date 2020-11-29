


import 'package:rxdart/rxdart.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/models/movie.dart';

class MovieDetailsBloc extends BlocBase {

  MovieDetailsBloc({this.movie}) {
    _streamController.add(movie);
  }

  //the internal object whose sink/stream we can use
  final BehaviorSubject<Movie> _streamController = BehaviorSubject<Movie>();

  //the stream of movie details. use this to show the details
  Stream<Movie> get stream => _streamController.stream;

  Movie movie;

  @override
  void dispose() {
    print('closing movie details streamcontroller');
    _streamController.close();
  }

}