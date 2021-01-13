

import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/api/models/swapi_character_properties.dart';
import 'package:star_wars_flutter/models/character.dart';

part 'swapi_character.g.dart';

@JsonSerializable()
class SwapiCharacter {

  SwapiCharacter(this.properties,);

  SwapiCharacterProperties properties;

  factory SwapiCharacter.fromJson(Map<String, dynamic> json) => _$SwapiCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$SwapiCharacterToJson(this);

  Character toCharacter() {
    return properties.toCharacter();
  }
}

