import 'package:json_annotation/json_annotation.dart';

part 'swapi_character_properties.g.dart';

@JsonSerializable()
class SwapiCharacterProperties {
  SwapiCharacterProperties({
    required this.id,
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

  String id;

  factory SwapiCharacterProperties.fromJson(Map<String, dynamic> json) =>
      _$SwapiCharacterPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SwapiCharacterPropertiesToJson(this);
}
