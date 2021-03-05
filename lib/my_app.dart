import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/router/router_delegate.dart';
import 'package:star_wars_flutter/router/starwars_parser.dart';
import 'package:star_wars_flutter/router/ui_pages.dart';
import 'package:star_wars_flutter/shared_prefs.dart';
import 'package:star_wars_flutter/theme/custom_theme.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = MoviesBloc(MoviesRepository());
    final StarWarsRouterDelegate delegate = StarWarsRouterDelegate();
    final StarWarsParser parser = StarWarsParser();

    delegate.setNewRoutePath(MoviesPageConfig);
    Get.put(delegate);

    return BlocProvider<MoviesBloc>(
        child: MaterialApp.router(
          theme: CustomTheme.lightTheme(context),
          darkTheme: CustomTheme.darkTheme(context),
          themeMode: sharedPrefs.hasUserOverriddenSystemTheme
              ? currentTheme.currentTheme
              : ThemeMode.system,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerDelegate: delegate,
          routeInformationParser: parser,
        ),
        bloc: moviesBloc);
  }
}
