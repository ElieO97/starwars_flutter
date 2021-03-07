import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/utils/star_wars_image_utils.dart';

void main() {
  test('Sort Movies by Release date', () {
    final List<Movie> movies = <Movie>[
      Movie(
          id: 1,
          title: 'film1',
          director: 'director1',
          releaseDate: '2020-06-10',
          producer: '',
          plot: '',
          url: ''),
      Movie(
          id: 2,
          title: 'film3',
          director: 'director2',
          releaseDate: '2020-06-30',
          producer: '',
          plot: '',
          url: ''),
      Movie(
          id: 3,
          title: 'film2',
          director: 'director2',
          releaseDate: '2020-06-15',
          producer: '',
          plot: '',
          url: ''),
      Movie(
          id: 4,
          title: 'film4',
          director: 'director2',
          releaseDate: '2020-12-15',
          producer: '',
          plot: '',
          url: ''),
    ];

    expect(sortMoviesByReleaseDate(movies)[0].title, 'film4');
  });
}
