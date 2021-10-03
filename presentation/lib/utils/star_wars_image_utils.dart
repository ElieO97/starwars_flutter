import 'package:presentation/model/movie_view_model.dart';

const Map<String, String> _imagesMoviesMap = <String, String>{
  'a new hope': 'assets/anewhope.jpg',
  'the empire strikes back': 'assets/theempirestrack.jpg',
  'return of the jedi': 'assets/returnofthejedi.jpg',
  'the phantom menace': 'assets/thephantommenace.jpg',
  'attack of the clones': 'assets/attackoftheclones.jpg',
  'revenge of the sith': 'assets/revengeofthesith.jpg'
};

const String _fallbackImagePath = 'assets/movie_placeholder.png';

String? findMovieImageAssetPath(String movieTitle) {
  if (_imagesMoviesMap.containsKey(movieTitle.toLowerCase())) {
    return _imagesMoviesMap[movieTitle.toLowerCase()];
  } else {
    return _fallbackImagePath;
  }
}

List<MovieViewModel> sortMoviesByReleaseDate(List<MovieViewModel> movies) {
  movies.sort((MovieViewModel movie1, MovieViewModel movie2) =>
      _releaseDateTime(movie1).compareTo(_releaseDateTime(movie2)));
  return movies.reversed.toList();
}

DateTime _releaseDateTime(MovieViewModel movie) {
  return DateTime.parse(movie.releaseDate);
}
