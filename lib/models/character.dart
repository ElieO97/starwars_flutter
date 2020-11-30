

import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars_flutter/utils/star_wars_image_utils.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {

  Character(
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



  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

}