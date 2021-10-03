import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:domain/interactor/movies/get_characters.dart';
import 'package:presentation/model/movie_view_model.dart';
import 'package:presentation/movie_details/movie_details_bloc.dart';
import 'package:presentation/movie_details/movie_details_screen.dart';
import 'package:presentation/router/router_delegate.dart';
import 'package:presentation/router/ui_pages.dart';

void goToMovieDetailsScreen(BuildContext context, MovieViewModel movieView) {
  final StarWarsRouterDelegate delegate = Get.find<StarWarsRouterDelegate>();

  delegate.pushWidget(
      BlocProvider<MovieDetailsBloc>(
        create: (BuildContext context) => MovieDetailsBloc(
            movie: movieView,
            getCharactersUseCase:
                Provider.of<GetCharacters>(context, listen: false)),
        child: MovieDetailsScreen(),
      ),
      MovieDetailsPageConfig);
}
