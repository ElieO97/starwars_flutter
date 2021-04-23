import 'package:star_wars_flutter/cache/mapper/entity_mapper.dart';
import 'package:star_wars_flutter/cache/model/cached_character.dart';
import 'package:star_wars_flutter/data/model/character_entity.dart';

class CharacterEntityMapper
    implements EntityMapper<CachedCharacter, CharacterEntity> {
  @override
  CharacterEntity mapFromCached(CachedCharacter type) {
    return CharacterEntity(
        id: type.id,
        birthDay: type.birthDay ?? '',
        eyeColor: type.eyeColor ?? '',
        gender: type.gender ?? '',
        hairColor: type.hairColor ?? '',
        height: type.height ?? '',
        homeWorld: type.homeWorld ?? '',
        mass: type.mass ?? '',
        name: type.name ?? '');
  }

  @override
  CachedCharacter mapToCached(CharacterEntity type) {
    throw UnimplementedError();
  }
}
