import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/movie.dart';
import 'package:star_wars_flutter/domain/repository/movie_repository.dart';

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
