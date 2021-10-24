import 'package:hive/hive.dart';

part 'cached_character.g.dart';

@HiveType(typeId: 2)
class CachedCharacter extends HiveObject {
  CachedCharacter(
      {required this.id,
      required this.birthDay,
      required this.eyeColor,
      required this.gender,
      required this.hairColor,
      required this.height,
      required this.homeWorld,
      required this.mass,
      required this.name});

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String birthDay;
  @HiveField(2)
  final String eyeColor;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String hairColor;
  @HiveField(5)
  final String height;
  @HiveField(6)
  final String homeWorld;
  @HiveField(7)
  final String mass;
  @HiveField(8)
  final String name;
}
