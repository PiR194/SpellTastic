import 'dart:ffi';

enum CharacterClass {
  alchemist,
  barbarian,
  bard,
  cleric,
  druid,
  fighter,
  goblins,
  gunslinger,
  hunter,
  inquisitor,
  magus,
  monk,
  oracle,
  paladin,
  ranger,
  rogue,
  sorcerer,
  summoner,
  warpriest,
  witch,
  wizard
}

extension GetImage on CharacterClass {
  String path() {
    var name = toString().split('.').last;
    name = name[0].toUpperCase() + name.substring(1);
    return name;
  }

  // CharacterClass getFromString(String class) {
  //   switch(class) {
  //     case 'Bar' :
  //       return CharacterClass.barbarian;
  //     case 'Alc' :
  //       return CharacterClass.alchemist;
  //     case 'Alc' :
  //       return CharacterClass.alchemist;
  //   }
  //}
}
