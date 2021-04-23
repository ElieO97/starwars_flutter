import 'package:hive/hive.dart';

part 'cached_character.g.dart';

@HiveType(typeId: 2)
class CachedCharacter extends HiveObject {
  CachedCharacter(
      {this.id,
      this.birthDay,
      this.eyeColor,
      this.gender,
      this.hairColor,
      this.height,
      this.homeWorld,
      this.mass,
      this.name,
      required this.url});

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? birthDay;
  @HiveField(2)
  final String? eyeColor;
  @HiveField(3)
  final String? gender;
  @HiveField(4)
  final String? hairColor;
  @HiveField(5)
  final String? height;
  @HiveField(6)
  final String? homeWorld;
  @HiveField(7)
  final String? mass;
  @HiveField(8)
  final String? name;
  @HiveField(9)
  final String url;
}
