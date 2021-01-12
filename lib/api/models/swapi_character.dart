

import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/models/character.dart';

part 'swapi_character.g.dart';

@JsonSerializable()
class SwapiCharacter {

  SwapiCharacter(
      this.birthDay,
      this.eyeColor,
      this.gender,
      this.hairColor,
      this.height,
      this.homeWorld,
      this.mass,
      this.name,
      );

  @JsonKey(name: 'birth_year')
  String birthDay;

  @JsonKey(name: 'eye_color')
  String eyeColor;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'hair_color')
  String hairColor;

  String height;

  @JsonKey(name: 'homeworld')
  String homeWorld;

  String mass;

  String name;

  String id;


  factory SwapiCharacter.fromJson(Map<String, dynamic> json) => _$SwapiCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$SwapiCharacterToJson(this);

  Character toCharacter() {
    return Character(id: id, birthDay: birthDay, eyeColor: eyeColor, gender: gender, hairColor: hairColor, height: height, homeWorld: homeWorld, mass: mass, name: name);
  }
}