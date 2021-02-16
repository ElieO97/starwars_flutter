import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/models/movie_state.dart';
import 'package:star_wars_flutter/ui/common_widgets/empty_result_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/errors_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/loading_widget.dart';
import 'package:star_wars_flutter/ui/home/movies_widget.dart';
import 'package:star_wars_flutter/theme/custom_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();

  @override
  void dispose() {
    super.dispose();
  }

  StreamBuilder<MoviesState> buildStreamBuilder(
      BuildContext context, MoviesBloc moviesBloc) {
    return StreamBuilder<MoviesState>(
        key: const Key('streamBuilder'),
        initialData: moviesBloc.moviesPopulated,
        stream: moviesBloc.stream,
        builder: (BuildContext context, AsyncSnapshot<MoviesState> snapshot) {
          final MoviesState data = snapshot.data;
          print('data snapshot = $data');
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(key: const Key('content'), children: <Widget>[
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
                      movies:
                          data is MoviesPopulated ? data.movies : <Movie>[]),
                ]),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = BlocProvider.of<MoviesBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(S().appName),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(S().appName),
              decoration: const BoxDecoration(color: Colors.black),
            ),
            ListTile(
                title: Text('Turn on Dark Mode'),
                trailing: Platform.isIOS
                    ? CupertinoSwitch(
                        value: CustomTheme.isDarkTheme,
                        onChanged: (bool value) {
                          currentTheme.toggleTheme();
                        },
                      )
                    : Switch(
                        value: CustomTheme.isDarkTheme,
                        onChanged: (bool value) {
                          currentTheme.toggleTheme();
                        },
                      )),
          ],
        )),
        body: Column(key: const Key('rootColumn'), children: <Widget>[
          Flexible(
            child: buildStreamBuilder(context, moviesBloc),
          ),
        ]));
  }
}
