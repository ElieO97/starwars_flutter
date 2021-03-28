class CharacterViewModel {
  CharacterViewModel(
      {this.id,
        this.birthDay,
        this.eyeColor,
        this.gender,
        this.hairColor,
        this.height,
        this.homeWorld,
        this.mass,
        this.name});

  final String id;
  final String birthDay;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String homeWorld;
  final String mass;
  final String name;

  @override
  String toString() {
    return '''id: $id, birthDay: $birthDay, eyeColor: $eyeColor,
    gender: $gender,
    hairColor: $hairColor,
    height: $height,
    homeWorld: $homeWorld,
    mass: $mass,
    name: $name''';
  }
}
