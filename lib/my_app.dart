import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_flutter/cache/db/hive_database.dart';
import 'package:star_wars_flutter/cache/db/starwars_database.dart';
import 'package:star_wars_flutter/cache/mapper/character_entity_mapper.dart';
import 'package:star_wars_flutter/cache/mapper/movie_entity_mapper.dart';
import 'package:star_wars_flutter/cache/movie_cache_impl.dart';
import '../presentation/lib/shared_prefs.dart';
import 'package:star_wars_flutter/data/mapper/character_mapper.dart';
import 'package:star_wars_flutter/data/mapper/movie_mapper.dart';
import 'package:star_wars_flutter/data/repository/movie_cache.dart';
import 'package:star_wars_flutter/data/repository/movie_remote.dart';
import 'package:star_wars_flutter/data/source/movie_cache_data_store.dart';
import 'package:star_wars_flutter/data/source/movie_data_store_factory.dart';
import 'package:star_wars_flutter/data/source/movie_remote_data_store.dart';
import 'package:star_wars_flutter/domain/interactor/movies/get_characters.dart';
import 'package:star_wars_flutter/domain/interactor/movies/get_movies.dart';
import 'package:star_wars_flutter/domain/repository/movie_repository.dart';
import 'package:star_wars_flutter/presentation/home/movies_bloc.dart';
import 'package:star_wars_flutter/presentation/mapper/movie_mapper.dart'
    as presentation_mapper;
import 'package:star_wars_flutter/presentation/router/router_delegate.dart';
import 'package:star_wars_flutter/presentation/router/starwars_parser.dart';
import 'package:star_wars_flutter/presentation/router/ui_pages.dart';
import 'package:star_wars_flutter/presentation/theme/custom_theme.dart';
import 'package:star_wars_flutter/remote/mapper/character_entity_mapper.dart'
    as character_remote_mapper;
import 'package:star_wars_flutter/remote/mapper/movie_entity_mapper.dart'
    as remote_mapper;
import 'package:star_wars_flutter/remote/mapper/movie_rating_entity_mapper.dart';
import 'package:star_wars_flutter/remote/movie_client.dart';
import 'package:star_wars_flutter/remote/movie_remote_impl.dart';

import '../data/lib/movie_data_repository.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
    final StarWarsRouterDelegate delegate =
        StarWarsRouterDelegate.getInstance();
    final StarWarsParser parser = StarWarsParser.getInstance();

    delegate.setNewRoutePath(MoviesPageConfig);
    Get.put(delegate);

    return MultiProvider(
      providers: <Provider<dynamic>>[
        Provider<MovieMapper>(
          create: (_) {
            return MovieMapper();
          },
        ),
        Provider<StarWarsDatabase>(
            create: (BuildContext context) => HiveDatabase.database),

        Provider<MovieClient>(create: (BuildContext context) => MovieClient()),

        Provider<MovieCache>(create: (BuildContext context) {
          return MovieCacheImpl(
              Provider.of<StarWarsDatabase>(context, listen: false),
              MovieEntityMapper(),
              CharacterEntityMapper());
        }),

        Provider<MovieRemote>(
          create: (BuildContext context) => MovieRemoteImpl(
              Provider.of<MovieClient>(context, listen: false),
              remote_mapper.MovieEntityMapper(),
              MovieRatingEntityMapper(),
              character_remote_mapper.CharacterEntityMapper()),
        ),
        Provider<MovieCacheDataStore>(
          create: (BuildContext context) => MovieCacheDataStore(
              Provider.of<MovieCache>(context, listen: false)),
        ),
        Provider<MovieRemoteDataStore>(
          create: (BuildContext context) => MovieRemoteDataStore(
              Provider.of<MovieRemote>(context, listen: false)),
        ),

        Provider<MovieDataStoreFactory>(
            create: (BuildContext context) => MovieDataStoreFactory(
                Provider.of<MovieCache>(context, listen: false),
                Provider.of<MovieRemoteDataStore>(context, listen: false),
                Provider.of<MovieCacheDataStore>(context, listen: false))),

        Provider<MoviesRepository>(
          create: (BuildContext context) => MoviesDataRepository(
              Provider.of<MovieDataStoreFactory>(context, listen: false),
              MovieMapper(),
              CharacterMapper()),
        ),

        Provider<GetMovies>(
            create: (BuildContext context) => GetMovies(
                Provider.of<MoviesRepository>(context, listen: false))),

        Provider<GetCharacters>(
          create: (BuildContext context) => GetCharacters(
              Provider.of<MoviesRepository>(context, listen: false)),
        ),

        // Add new global providers here
      ],
      builder: (BuildContext context, Widget? child) {
        return BlocProvider<MoviesBloc>(
          create: (BuildContext context) => MoviesBloc(
              Provider.of<GetMovies>(context, listen: false),
              presentation_mapper.MovieMapper()),
          child: MaterialApp.router(
            theme: CustomTheme.lightTheme(context),
            darkTheme: CustomTheme.darkTheme(context),
            themeMode: sharedPrefs.hasUserOverriddenSystemTheme
                ? currentTheme.currentTheme
                : ThemeMode.system,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const <Locale>[Locale('en'), Locale('fr')],
            routerDelegate: delegate,
            routeInformationParser: parser,
          ),
        );
      },
    );
  }
}