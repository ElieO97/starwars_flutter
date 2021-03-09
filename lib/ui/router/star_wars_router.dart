import 'package:flutter/material.dart';
import 'package:star_wars_flutter/presentation/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/presentation/bloc/movie_details_bloc.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:get/get.dart';
import 'package:star_wars_flutter/ui/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';
import 'package:star_wars_flutter/ui/movie_details/movie_details_screen.dart';
import 'package:star_wars_flutter/ui/router/router_delegate.dart';
import 'package:star_wars_flutter/ui/router/ui_pages.dart';

void goToMovieDetailsScreen(BuildContext context, MovieViewModel movie, MovieMapper mapper) {
  final StarWarsRouterDelegate delegate = Get.find<StarWarsRouterDelegate>();
  delegate.pushWidget(
      BlocProvider<MovieDetailsBloc>(
        bloc: MovieDetailsBloc(
            movie: mapper.mapToView(movie), moviesRepository: MoviesRepository()),
        child: MovieDetailsScreen(),
      ),
      MovieDetailsPageConfig);
}
