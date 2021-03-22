import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/domain/repository/movie_repository.dart';

class GetCharacters
    extends FutureUseCase<Map<int, List<String>>, List<Character>> {
  GetCharacters(this.moviesRepository);

  MoviesRepository moviesRepository;

  @override
  Future<List<Character>> execute(Map<int, List<String>> params) async {
    final int movieId = params.keys.first;
    final List<String> charactersIds = params[movieId];

    final List<Character> characters =
        await moviesRepository.fetchMovieCharacters(movieId, charactersIds);
    return characters;
  }
}
