


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/api/models/swapi_movie.dart';
import 'package:star_wars_flutter/models/movie_state.dart';
import 'package:star_wars_flutter/ui/common_widgets/empty_result_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/errors_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/loading_widget.dart';
import 'package:star_wars_flutter/ui/home_route/movies_widget.dart';

class HomeRoute extends StatefulWidget {

  const HomeRoute({Key key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute>  {

  _HomeRouteState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = BlocProvider.of<MoviesBloc>(context);
    // print("moviesbloc stream = ${moviesBloc.stream}");
      return Scaffold (
        appBar: AppBar (
          title: Text(S().appName),
        ),
          body: Column(key: const Key('rootColumn'), children: <Widget>[
            Flexible(child: buildStreamBuilder(context, moviesBloc),),
          ])
      );
  }


  StreamBuilder<MoviesState> buildStreamBuilder(BuildContext context, MoviesBloc moviesBloc) {
      return StreamBuilder<MoviesState> (
           key: const Key('streamBuilder'),
           initialData: moviesBloc.moviesPopulated,
           stream: moviesBloc.stream,
           builder: (BuildContext context, AsyncSnapshot<MoviesState> snapshot) {
             final MoviesState data = snapshot.data;
             print('data snapshot = $data');
             return Column (
               children: <Widget> [
               Expanded (
                  child: Stack (
                    key: const Key('content'),
                    children: <Widget> [
                      // Fade in an Empty Result screen if the search contained
                      // no items
                      EmptyWidget(visible: data is MoviesEmpty),

                      // Fade in a loading screen when results are being fetched
                      LoadingWidget(visible: data is MoviesLoading),

                      // Fade in an error if something went wrong when fetching
                      // the results
                      ErrorsWidget(
                          visible: data is MoviesError,
                          error: data is MoviesError ? data.error : ''),

                      // Fade in the Result if available
                      MoviesWidget(
                          moviesBloc: moviesBloc,
                          movies: data is MoviesPopulated ? data.movies  : <SwapiMovie>[]),

                    ]

                 ),
                ),
               ],
             ) ;
      });
   }


}