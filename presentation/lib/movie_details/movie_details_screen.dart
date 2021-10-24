import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/common_widgets/empty_result_widget.dart';
import 'package:presentation/common_widgets/errors_widget.dart';
import 'package:presentation/common_widgets/loading_widget.dart';
import 'package:presentation/movie_details/movie_details_bloc.dart';
import 'package:presentation/movie_details/movie_details_state.dart';

import 'movie_details_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsScreenStatefulState createState() =>
      _MovieDetailsScreenStatefulState();
}

class _MovieDetailsScreenStatefulState extends State<MovieDetailsScreen> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    final MovieDetailsBloc movieDetailsBloc =
        BlocProvider.of<MovieDetailsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(movieDetailsBloc.movie.title),
      ),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (BuildContext context, MovieDetailsState state) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(key: const Key('content'), children: <Widget>[
                  EmptyWidget(visible: state is MovieDetailsEmpty),
                  LoadingWidget(visible: state is MovieDetailsLoading),
                  ErrorsWidget(
                      visible: state is MovieDetailsError,
                      error: state is MovieDetailsError ? state.error : ''),
                  Stack(
                    key: const Key('content'),
                    children: <Widget>[
                      if (state is MovieDetailsPopulated)
                        MovieDetailsWidget(movie: state.movie)
                    ],
                  )
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
