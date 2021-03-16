import 'package:star_wars_flutter/domain/interactor/future_use_case.dart';
import 'package:star_wars_flutter/domain/model/character.dart';
import 'package:star_wars_flutter/domain/repository/movie_repository.dart';


class GetCharacters extends FutureUseCase<Map<int, List<String>>, List<Character>> {
  GetCharacters(this.moviesRepository);

  MoviesRepository moviesRepository;

  @override
  Future<List<Character>> execute(Map<int, List<String>> params) async {
    // int movieId = params.entries.
    //
    // final List<Character> characters = await moviesRepository.fetchMovieCharacters(, charactersIds);
    // return characters;
  }
}