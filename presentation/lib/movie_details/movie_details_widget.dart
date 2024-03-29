import 'package:flutter/material.dart';
import 'package:presentation/model/movie_view_model.dart';
import 'package:presentation/movie_details/movie_details_content_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({required this.movie});

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  Widget buildContent(BuildContext context) {
    return Container(child: MovieDetailsContentWidget(movie));
  }
}
