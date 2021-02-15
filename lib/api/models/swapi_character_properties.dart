import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/models/character.dart';

part 'swapi_character_properties.g.dart';

@JsonSerializable()
class SwapiCharacterProperties {
  SwapiCharacterProperties(
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

  factory SwapiCharacterProperties.fromJson(Map<String, dynamic> json) =>
      _$SwapiCharacterPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SwapiCharacterPropertiesToJson(this);

  Character toCharacter() {
    return Character(
        id: id,
        birthDay: birthDay,
        eyeColor: eyeColor,
        gender: gender,
        hairColor: hairColor,
        height: height,
        homeWorld: homeWorld,
        mass: mass,
        name: name);
  }
}
