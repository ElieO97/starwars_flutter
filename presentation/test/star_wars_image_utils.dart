import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/model/movie_view_model.dart';
import 'package:presentation/utils/star_wars_image_utils.dart';

void main() {
  test('Sort Movies by Release date', () {
    final List<MovieViewModel> movies = <MovieViewModel>[
      MovieViewModel(
          id: 1,
          title: 'film1',
          director: 'director1',
          releaseDate: '2020-06-10',
          producer: '',
          plot: '',
          url: '',
          characters: ['']),
      MovieViewModel(
          id: 2,
          title: 'film3',
          director: 'director2',
          releaseDate: '2020-06-30',
          producer: '',
          plot: '',
          url: '',
          characters: ['']),
      MovieViewModel(
          id: 3,
          title: 'film2',
          director: 'director2',
          releaseDate: '2020-06-15',
          producer: '',
          plot: '',
          url: '',
          characters: ['']),
      MovieViewModel(
          id: 4,
          title: 'film4',
          director: 'director2',
          releaseDate: '2020-12-15',
          producer: '',
          plot: '',
          url: '',
          characters: ['']),
    ];

    expect(sortMoviesByReleaseDate(movies)[0].title, 'film4');
  });
}
