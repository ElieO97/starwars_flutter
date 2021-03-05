import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/bloc/movie_details_bloc.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/router/router_delegate.dart';
import 'package:star_wars_flutter/router/ui_pages.dart';
import 'package:get/get.dart';
import 'package:star_wars_flutter/ui/movie_details/movie_details_screen.dart';

void goToMovieDetailsScreen(BuildContext context, Movie movie) {
  final StarWarsRouterDelegate delegate = Get.find<StarWarsRouterDelegate>();
  delegate.pushWidget(
      BlocProvider<MovieDetailsBloc>(
        bloc: MovieDetailsBloc(
            movie: movie, moviesRepository: MoviesRepository()),
        child: MovieDetailsScreen(),
      ),
      MovieDetailsPageConfig);
}
