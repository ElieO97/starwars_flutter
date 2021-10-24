import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/utils/movie_utils.dart';

void main() {
  test('Get ids from urls', () {
    expect(
        MovieUtils.charatersUrlsToIds(<String>[
          'https://swapi.dev/api/people/1/',
          'https://swapi.dev/api/people/2/'
        ]),
        <String>['1', '2']);
    expect(
        MovieUtils.charatersUrlsToIds(<String>[
          'https://swapi.dev/api/people/1/',
          'https://swapi.dev/api/people/2/'
        ].join(',').split(',')),
        <String>['1', '2']);
  });
}
