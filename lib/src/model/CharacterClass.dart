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
}
