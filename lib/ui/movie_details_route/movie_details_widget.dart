

import 'package:flutter/material.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/ui/movie_details_route/movie_details_content_widget.dart';

class MovieDetailsWidget extends StatelessWidget {


  const MovieDetailsWidget({@required this.movie});

  final SwapiMovie movie;

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }


  Widget buildContent(BuildContext context) {
    return Container(child: MovieDetailsContentWidget(movie));
  }
}