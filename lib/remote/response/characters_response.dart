import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/remote/model/swapi_character.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse {
  CharactersResponse({required this.result});

  SwapiCharacter? result;

  bool get isEmpty => !hasResults();

  bool hasResults() {
    return result != null;
  }

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
