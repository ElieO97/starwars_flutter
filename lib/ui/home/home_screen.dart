import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars_flutter/cache/shared_prefs.dart';
import 'package:star_wars_flutter/presentation/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/presentation/model/movie_state.dart';
import 'package:star_wars_flutter/presentation/model/movie_view.dart';
import 'package:star_wars_flutter/ui/common_widgets/empty_result_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/errors_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/loading_widget.dart';
import 'package:star_wars_flutter/ui/common_widgets/platform_switch.dart';
import 'package:star_wars_flutter/ui/home/movies_widget.dart';
import 'package:star_wars_flutter/ui/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/ui/model/movie_view_model.dart';
import 'package:star_wars_flutter/ui/theme/custom_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieMapper mapper = MovieMapper();

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  BlocBuilder<MoviesBloc, MoviesState> buildStreamBuilder(
      BuildContext context, MoviesBloc moviesBloc) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        bloc: BlocProvider.of<MoviesBloc>(context),
        builder: (BuildContext context, dynamic state) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(key: const Key('content'), children: <Widget>[
                  // Fade in an Empty Result screen if the search contained
                  // no items
                  EmptyWidget(visible: state is MoviesEmpty),

                  // Fade in a loading screen when results are being fetched
                  LoadingWidget(visible: state is MoviesLoading),

                  // Fade in an error if something went wrong when fetching
                  // the results
                  ErrorsWidget(
                      visible: state is MoviesError,
                      error: state is MoviesError ? state.error : ''),

                  // Fade in the Result if available
                  MoviesWidget(
                      moviesBloc: moviesBloc,
                      movies: state is MoviesPopulated
                          ? state.movies
                              .map((MovieView movie) =>
                                  mapper.mapToViewModel(movie))
                              .toList()
                          : <MovieViewModel>[]),
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
          title: Text(AppLocalizations.of(context)!.appName),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(AppLocalizations.of(context)!.appName.toUpperCase()),
              decoration:
                  BoxDecoration(color: Theme.of(context).appBarTheme.color),
            ),
            ListTile(
                title: Text(sharedPrefs.isDarkTheme
                    ? AppLocalizations.of(context)!.turn_off_dark_mode
                    : AppLocalizations.of(context)!.turn_on_dark_mode),
                trailing: PlatformSwitch(
                  value: sharedPrefs.isDarkTheme,
                  onChanged: (bool value) {
                    currentTheme.toggleTheme();
                  },
                  activeColor: Colors.amber,
                  trackColor: Colors.grey,
                  inactiveTrackColor: Colors.grey,
                )),
          ],
        )),
        body: Column(key: const Key('rootColumn'), children: <Widget>[
          Flexible(
            child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (BuildContext context, dynamic state) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(key: const Key('content'), children: <Widget>[
                      // Fade in an Empty Result screen if the search contained
                      // no items
                      EmptyWidget(visible: state is MoviesEmpty),

                      // Fade in a loading screen when results are being fetched
                      LoadingWidget(visible: state is MoviesLoading),

                      // Fade in an error if something went wrong when fetching
                      // the results
                      ErrorsWidget(
                          visible: state is MoviesError,
                          error: state is MoviesError ? state.error : ''),

                      // Fade in the Result if available
                      MoviesWidget(
                          moviesBloc: moviesBloc,
                          movies: state is MoviesPopulated
                              ? state.movies
                                  .map((MovieView movie) =>
                                      mapper.mapToViewModel(movie))
                                  .toList()
                              : <MovieViewModel>[]),
                    ]),
                  ),
                ],
              );
            }),
          ),
        ]));
  }
}
