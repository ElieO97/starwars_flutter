import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/domain/repository/movie_repository.dart';

class GetCharacters
    extends FutureUseCase<Map<int, List<String>>, List<Character>> {
  GetCharacters(this.moviesRepository);

  MoviesRepository moviesRepository;

  @override
  Future<List<Character>> execute(Map<int, List<String>> params) async {
    print('GetCharacters: execute method called: $params');
    final int movieId = params.keys.first;
    final List<String>? charactersIds = params[movieId];

    if (charactersIds == null) {
      return [];
    }

    print(
        'GetCharacters: execute method called: moviedId => $movieId, charactersIds: $charactersIds');

    final List<Character> characters =
        await moviesRepository.fetchMovieCharacters(movieId, charactersIds);

    print('GetCharacters: execute method called:  characters: $characters');
    return characters;
  }
}
