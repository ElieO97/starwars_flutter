import 'package:domain/model/character.dart';
import 'package:domain/repository/movie_repository.dart';

import '../future_use_case.dart';

class GetCharacters
    extends FutureUseCase<Map<int, List<String>>, List<Character>> {
  GetCharacters(this.moviesRepository);

  MoviesRepository moviesRepository;

  @override
  Future<List<Character>> execute(Map<int, List<String>> params) async {
    final int movieId = params.keys.first;
    final List<String>? charactersIds = params[movieId];

    if (charactersIds == null) {
      return [];
    }

    final List<Character> characters =
        await moviesRepository.fetchMovieCharacters(movieId, charactersIds);

    return characters;
  }
}
