import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/domain/model/character.dart';

part 'swapi_character_properties.g.dart';

@JsonSerializable()
class SwapiCharacterProperties {
  SwapiCharacterProperties({
    this.id,
    required this.birthDay,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.homeWorld,
    required this.mass,
    required this.name,
  });

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

  String? id;

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
