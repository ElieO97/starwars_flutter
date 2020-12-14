

import 'package:json_annotation/json_annotation.dart';

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
      this.name
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



  factory SwapiCharacter.fromJson(Map<String, dynamic> json) => _$SwapiCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$SwapiCharacterToJson(this);

}