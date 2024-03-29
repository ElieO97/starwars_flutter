import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/common_widgets/empty_result_widget.dart';
import 'package:presentation/common_widgets/errors_widget.dart';
import 'package:presentation/common_widgets/loading_widget.dart';
import 'package:presentation/common_widgets/platform_switch.dart';
import 'package:presentation/home/movies_bloc.dart';
import 'package:presentation/home/movies_state.dart';
import 'package:presentation/home/movies_widget.dart';
import 'package:presentation/model/movie_view_model.dart';
import 'package:presentation/shared_prefs.dart';
import 'package:presentation/theme/custom_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          movies: state is MoviesPopulated
                              ? state.movies
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
