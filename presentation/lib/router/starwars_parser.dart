import 'package:flutter/material.dart';
import 'ui_pages.dart';

class StarWarsParser extends RouteInformationParser<PageConfiguration> {
  StarWarsParser._();

  static StarWarsParser? _instance;

  static StarWarsParser getInstance() {
    _instance ??= StarWarsParser._();

    return _instance!;
  }

  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return MoviesPageConfig;
    }

    final String path = uri.pathSegments[0];

    switch (path) {
      case MoviesPath:
        return MoviesPageConfig;
      case MovieDetailsPath:
        return MovieDetailsPageConfig;
      default:
        return MoviesPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.MovieDetails:
        return const RouteInformation(location: MovieDetailsPath);
      case Pages.Movies:
        return const RouteInformation(location: MoviesPath);
      default:
        return const RouteInformation(location: MoviesPath);
    }
  }
}
