import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/bloc/movie_details_bloc.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/ui/movie_details_route/movie_details_widget.dart';

class MovieDetailsRoute extends StatefulWidget {

  @override
  _MovieDetailsStatefulState createState() => _MovieDetailsStatefulState();
}

class _MovieDetailsStatefulState extends State<MovieDetailsRoute> {
  MovieDetailsBloc movieDetailsBloc;
  String title = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    movieDetailsBloc = BlocProvider.of<MovieDetailsBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text(movieDetailsBloc.movie.title),),
      body: StreamBuilder<Movie>(
        key: const Key('streamBuilder'),
        stream: movieDetailsBloc.stream,
        // initialData: movieDetailsBloc.initialData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final Movie data = snapshot.data as Movie;
           if(data is Movie) {
             title = data.title;
           }
           return Stack(
            key: const Key('content'),
            children: <Widget>[
              MovieDetailsWidget(movie: movieDetailsBloc.movie)
            ],
          );
        },
      ),
    );
  }
}