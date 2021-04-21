import 'package:flutter/material.dart';

const String MoviesPath = '/movies';
const String MovieDetailsPath = '/details';

enum Pages { Movies, MovieDetails }

class PageConfiguration {
  PageConfiguration(
      {required this.key, required this.path, required this.uiPage});

  final String key;
  final String path;
  final Pages uiPage;
}

PageConfiguration MoviesPageConfig =
    PageConfiguration(key: 'movies', path: MoviesPath, uiPage: Pages.Movies);

PageConfiguration MovieDetailsPageConfig = PageConfiguration(
    key: 'details', path: MovieDetailsPath, uiPage: Pages.MovieDetails);
