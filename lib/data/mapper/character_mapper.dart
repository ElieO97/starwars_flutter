import 'package:star_wars_flutter/data/mapper/mapper.dart';
import 'package:star_wars_flutter/data/model/character_entity.dart';
import 'package:star_wars_flutter/domain/model/character.dart';

class CharacterMapper implements Mapper<CharacterEntity, Character> {
  @override
  Character mapFromEntity(CharacterEntity type) {
    final char = Character(
        birthDay: type.birthDay,
        eyeColor: type.eyeColor,
        gender: type.gender,
        hairColor: type.hairColor,
        height: type.height,
        homeWorld: type.homeWorld,
        mass: type.mass,
        name: type.name);
    char.id = type.id;
    return char;
  }

  @override
  CharacterEntity mapToEntity(Character type) {
    final char = CharacterEntity(
        birthDay: type.birthDay,
        eyeColor: type.eyeColor,
        gender: type.gender,
        hairColor: type.hairColor,
        height: type.height,
        homeWorld: type.homeWorld,
        mass: type.mass,
        name: type.name);
    char.id = type.id;
    return char;
  }
}
