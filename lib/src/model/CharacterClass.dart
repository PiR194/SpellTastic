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

extension GetSpellPerDay on CharacterClass {
  List<int> getListSpellPerDay(String cclass, int level) {
    switch (cclass) {
      case 'Bar':
        switch (level) {
          case 1:
            return [1, 0, 0, 0, 0, 0, 0, 0, 0];
          case 2:
            return [2, 0, 0, 0, 0, 0, 0, 0, 0];
          case 3:
            return [3, 0, 0, 0, 0, 0, 0, 0, 0];
          case 4:
            return [3, 1, 0, 0, 0, 0, 0, 0, 0];
          case 5:
            return [4, 2, 0, 0, 0, 0, 0, 0, 0];
          case 6:
            return [4, 3, 0, 0, 0, 0, 0, 0, 0];
          case 7:
            return [4, 3, 1, 0, 0, 0, 0, 0, 0];
          case 8:
            return [4, 4, 2, 0, 0, 0, 0, 0, 0];
          case 9:
            return [5, 4, 3, 0, 0, 0, 0, 0, 0];
          case 10:
            return [5, 4, 3, 1, 0, 0, 0, 0, 0];
          case 11:
            return [5, 4, 4, 2, 0, 0, 0, 0, 0];
          case 12:
            return [5, 5, 4, 3, 0, 0, 0, 0, 0];
          case 13:
            return [5, 5, 4, 3, 1, 0, 0, 0, 0];
          case 14:
            return [5, 5, 4, 4, 2, 0, 0, 0, 0];
          case 15:
            return [5, 5, 5, 4, 3, 0, 0, 0, 0];
          case 16:
            return [5, 5, 5, 4, 3, 1, 0, 0, 0];
          case 17:
            return [5, 5, 5, 4, 4, 2, 0, 0, 0];
          case 18:
            return [5, 5, 5, 5, 4, 3, 0, 0, 0];
          case 19:
            return [5, 5, 5, 5, 5, 4, 0, 0, 0];
          case 20:
            return [5, 5, 5, 5, 5, 5, 0, 0, 0];
          default:
            return [];
        }
      default:
        return [];
    }
  }
}
