import 'package:domain/model/movie.dart';
import 'package:domain/repository/movie_repository.dart';

import '../future_use_case.dart';

/// Use case used for retrieving a [List] of [Movie] instances from the [MoviesRepository]
class GetMovies extends FutureUseCase<void, List<Movie>> {
  GetMovies(this.moviesRepository);

  MoviesRepository moviesRepository;

  @override
  Future<List<Movie>> execute(void params) async {
    final List<Movie> movies = await moviesRepository.fetchAllMovies();
    return movies;
  }
}
