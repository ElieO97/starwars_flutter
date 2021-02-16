import 'package:flutter/material.dart';
import 'package:star_wars_flutter/bloc/movies_bloc.dart';
import 'package:star_wars_flutter/bloc/bloc_provider.dart';
import 'package:star_wars_flutter/generated/l10n.dart';
import 'package:star_wars_flutter/repository/movies_repository.dart';
import 'package:star_wars_flutter/theme/custom_theme.dart';
import 'package:star_wars_flutter/ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = MoviesBloc(MoviesRepository());
    return BlocProvider<MoviesBloc>(
        child: MaterialApp(
          theme: CustomTheme.darkTheme(context),
          home: const HomeScreen(),
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
        bloc: moviesBloc);
  }
}
