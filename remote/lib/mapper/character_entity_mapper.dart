import 'package:data/model/character_entity.dart';
import 'package:remote/mapper/entity_mapper.dart';
import 'package:remote/model/swapi_character_properties.dart';

class CharacterEntityMapper
    implements EntityMapper<SwapiCharacterProperties, CharacterEntity> {
  @override
  CharacterEntity mapFromRemote(SwapiCharacterProperties type) {
    final char = CharacterEntity(
        birthDay: type.birthDay,
        eyeColor: type.eyeColor,
        gender: type.gender,
        hairColor: type.hairColor,
        height: type.height,
        homeWorld: type.homeWorld,
        mass: type.mass,
        name: type.name);
    char.id = type.id ?? '';
    return char;
  }
}
