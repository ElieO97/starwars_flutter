import 'package:flutter/material.dart';
import 'package:star_wars_flutter/models/movie_details_state.dart';
import 'package:star_wars_flutter/presentation/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/presentation/bloc/movie_details_bloc.dart';
import 'package:star_wars_flutter/ui/common_widgets/empty_result_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/errors_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/loading_widget.dart';
import 'package:star_wars_flutter/ui/movie_details/movie_details_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsScreenStatefulState createState() => _MovieDetailsScreenStatefulState();
}

class _MovieDetailsScreenStatefulState extends State<MovieDetailsScreen> {
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
      appBar: AppBar(
        title: Text(movieDetailsBloc.movie.title),
      ),
      body: StreamBuilder<MovieDetailsState>(
        key: const Key('streamBuilder'),
        stream: movieDetailsBloc.stream,
        initialData: movieDetailsBloc.movieDetailsState,
        builder:
            (BuildContext context, AsyncSnapshot<MovieDetailsState> snapshot) {
          final MovieDetailsState data = snapshot.data;

          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(key: const Key('content'), children: <Widget>[
                  EmptyWidget(visible: data is MovieDetailsEmpty),
                  LoadingWidget(visible: data is MovieDetailsLoading),
                  ErrorsWidget(
                      visible: data is MovieDetailsError,
                      error: data is MovieDetailsError ? data.error : ''),
                  Stack(
                    key: const Key('content'),
                    children: <Widget>[
                      if (data is MovieDetailsPopulated)
                        MovieDetailsWidget(movie: data.movie)
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
