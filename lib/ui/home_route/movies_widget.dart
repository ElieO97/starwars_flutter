


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/ui/home_route/movie_summary_widget.dart';

class MoviesWidget extends StatefulWidget {

  const MoviesWidget ({Key key, @required this.movies, @required this.moviesBloc }): super(key: key);

  final List<SwapiMovie> movies;
  final MoviesBloc moviesBloc;


  @override
  MoviesWidgetState createState() {
    return MoviesWidgetState();
  }

}

class MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext context) {
    print('MoviesWidgetState build method: ${widget.movies}');
    return MoviesListView(movies: widget.movies);
  }
}


class MoviesListView extends StatelessWidget {

  const MoviesListView(
      {Key key,
        @required this.movies})
      : super(key: key);

  final List<SwapiMovie> movies;

  @override
  Widget build(BuildContext context) {
    print('MoviesListView build method: ${movies.length}');
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: movies.isNotEmpty ? 1.0 : 0.0,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {

          final SwapiMovie movie = movies[index];
          return MovieSummaryWidget(movie: movie);
        },
      ),
    );
  }
}
