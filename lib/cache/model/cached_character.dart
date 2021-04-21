class CachedCharacter {
  CachedCharacter(
      {this.id,
      required this.birthDay,
      required this.eyeColor,
      required this.gender,
      required this.hairColor,
      required this.height,
      required this.homeWorld,
      required this.mass,
      required this.name});

  final String? id;
  final String birthDay;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String homeWorld;
  final String mass;
  final String name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'birthDay': birthDay,
      'eyeColor': eyeColor,
      'gender': gender,
      'hairColor': hairColor,
      'height': height,
      'homeWorld': homeWorld,
      'mass': mass,
      'name': name
    };
  }
}
