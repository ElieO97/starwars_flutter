

import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars_flutter/models/movie.dart';
import 'package:star_wars_flutter/utils/star_wars_image_utils.dart';

void main() {
  test('Sort Movies by Release date', ()  {

    final List<Movie> movies = <Movie>[Movie('film1', 'director1', '2020-06-10', '', <String>[''], 1, ''),
      Movie('film3', 'director2', '2020-06-30', '', <String>[''], 1, ''),
      Movie('film2', 'director2', '2020-06-15', '', <String>[''], 1, ''),
      Movie('film4', 'director2', '2020-12-15', '', <String>[''], 1, ''),
    ];


    expect(sortMoviesByReleaseDate(movies)[0].title, 'film4');
  });
}