import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/repo/movies_repository.dart';
import 'package:star_wars_flutter/ui/home_route/home_route.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = MoviesBloc(MoviesRepository());
    return BlocProvider(
        child: MaterialApp (
          theme: ThemeData(
            dividerColor: Colors.white,
            brightness: Brightness.dark,
            primarySwatch: Colors.blueGrey,
            accentColor: Colors.deepOrange,
          ),
            home: const HomeRoute(),
           localizationsDelegates: const<LocalizationsDelegate<dynamic>>[
             S.delegate,

           ],
          supportedLocales: S.delegate.supportedLocales,
        ),
        bloc: moviesBloc);
  }
}



