

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/bloc/movie_details_bloc.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/ui/movie_details_route/movie_details_route.dart';

void goToMovieDetailsScreen(BuildContext context, SwapiMovie movie) {
  Navigator.push(
    context,
    MaterialPageRoute<MovieDetailsRoute>(builder: (BuildContext context) {return BlocProvider<MovieDetailsBloc>(
      bloc: MovieDetailsBloc(movie: movie, moviesRepository: MoviesRepository()),
      child: MovieDetailsRoute(),
    );}),
  );

}