import 'dart:ffi';
import 'dart:io';

enum CharacterClass {
  alchemist,
  adept, //new
  antipaladin, // new
  arcanist, // new
  artifice, // new
  bard,
  bloodrager,
  cleric,
  crimsonAssassin, // new
  druid,
  darkness, // new
  hunter,
  inquisitor,
  investigator, // new
  glory, // new
  magus,
  medium,
  mesmerist,
  madness,
  occultist,
  oracle,
  paladin,
  psychic,
  ranger,
  sahirAfiyun, // new
  shaman,
  skald, // new
  sorcerer,
  spiritualist,
  summoner,
  unchainedSummoner, // new
  warpriest,
  witch,
  wizard,
  // glory, madness, artifice ??
  unknown
}

extension GetImage on CharacterClass {
  String getImagePath() {
    var name = toString().toLowerCase().split('.').last;
    name = name[0].toUpperCase() + name.substring(1);
    var imagePath = "assets/class_icons/$name.png";

    if (File(imagePath).existsSync()) {
      return imagePath;
    } else {
      return "assets/images/default_profil.png";
    }
  }
}

// Gestion des étoiles ??
// A quoi servent les +1 (prêtre) ??
extension GetSpellPerDay on CharacterClass {
  Map<String, Map<int, List<int>>> getSpellPerDay() {
    final spellPerDay = {
      'alchemist': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'bard': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'bloodrager': {
        1: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        8: [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        9: [0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        10: [0, 2, 1, 1, 0, 0, 0, 0, 0, 0],
        11: [0, 2, 1, 1, 0, 0, 0, 0, 0, 0],
        12: [0, 2, 2, 1, 0, 0, 0, 0, 0, 0],
        13: [0, 3, 2, 1, 1, 0, 0, 0, 0, 0],
        14: [0, 3, 2, 1, 1, 0, 0, 0, 0, 0],
        15: [0, 3, 2, 2, 1, 0, 0, 0, 0, 0],
        16: [0, 3, 3, 2, 1, 0, 0, 0, 0, 0],
        17: [0, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        18: [0, 4, 3, 2, 2, 0, 0, 0, 0, 0],
        19: [0, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        20: [0, 4, 4, 3, 2, 0, 0, 0, 0, 0],
      },
      'cleric': {
        //(+1 HERE)
        1: [3, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 3, 2, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 4, 3, 2, 0, 0, 0, 0, 0, 0],
        6: [4, 4, 4, 3, 0, 0, 0, 0, 0, 0],
        7: [4, 5, 4, 3, 2, 0, 0, 0, 0, 0],
        8: [4, 5, 4, 4, 3, 0, 0, 0, 0, 0],
        9: [4, 5, 5, 4, 3, 2, 0, 0, 0, 0],
        10: [4, 5, 5, 4, 4, 3, 0, 0, 0, 0],
        11: [4, 5, 5, 5, 4, 3, 2, 0, 0, 0],
        12: [4, 5, 5, 5, 4, 4, 3, 0, 0, 0],
        13: [4, 5, 5, 5, 5, 4, 3, 2, 0, 0],
        14: [4, 5, 5, 5, 5, 4, 4, 3, 0, 0],
        15: [4, 5, 5, 5, 5, 5, 4, 3, 2, 0],
        16: [4, 5, 5, 5, 5, 5, 4, 4, 3, 0],
        17: [4, 5, 5, 5, 5, 5, 5, 4, 3, 2],
        18: [4, 5, 5, 5, 5, 5, 5, 4, 4, 3],
        19: [4, 5, 5, 5, 5, 5, 5, 5, 4, 4],
        20: [4, 5, 5, 5, 5, 5, 5, 5, 5, 5],
      },
      'druid': {
        1: [3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 3, 2, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 3, 2, 1, 0, 0, 0, 0, 0, 0],
        6: [4, 3, 3, 2, 0, 0, 0, 0, 0, 0],
        7: [4, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        8: [4, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        9: [4, 4, 4, 3, 2, 1, 0, 0, 0, 0],
        10: [4, 4, 4, 3, 3, 2, 0, 0, 0, 0],
        11: [4, 4, 4, 4, 3, 2, 1, 0, 0, 0],
        12: [4, 4, 4, 4, 3, 3, 2, 0, 0, 0],
        13: [4, 4, 4, 4, 4, 3, 2, 1, 0, 0],
        14: [4, 4, 4, 4, 4, 3, 2, 2, 0, 0],
        15: [4, 4, 4, 4, 4, 4, 3, 2, 1, 0],
        16: [4, 4, 4, 4, 4, 4, 3, 3, 2, 0],
        17: [4, 4, 4, 4, 4, 4, 4, 3, 2, 1],
        18: [4, 4, 4, 4, 4, 4, 4, 3, 3, 2],
        19: [4, 4, 4, 4, 4, 4, 4, 4, 3, 3],
        20: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
      },
      'hunter': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'inquisitor': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'magus': {
        1: [3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 4, 2, 1, 0, 0, 0, 0, 0, 0],
        6: [5, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [5, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [5, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [5, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [5, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [5, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [5, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [5, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [5, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [5, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [5, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [5, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [5, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [5, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [5, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'medium': {
        1: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        8: [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        9: [0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        10: [0, 2, 1, 1, 0, 0, 0, 0, 0, 0],
        11: [0, 2, 1, 1, 0, 0, 0, 0, 0, 0],
        12: [0, 2, 2, 1, 0, 0, 0, 0, 0, 0],
        13: [0, 3, 2, 1, 1, 0, 0, 0, 0, 0],
        14: [0, 3, 2, 1, 1, 0, 0, 0, 0, 0],
        15: [0, 3, 2, 2, 1, 0, 0, 0, 0, 0],
        16: [0, 3, 3, 2, 1, 0, 0, 0, 0, 0],
        17: [0, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        18: [0, 4, 3, 2, 2, 0, 0, 0, 0, 0],
        19: [0, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        20: [0, 4, 4, 3, 2, 0, 0, 0, 0, 0],
      },
      'mesmerit': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'occultist': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'oracle': {
        1: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 4, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 5, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 6, 3, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 6, 4, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 6, 5, 3, 0, 0, 0, 0, 0, 0],
        7: [0, 6, 6, 4, 0, 0, 0, 0, 0, 0],
        8: [0, 6, 6, 5, 3, 0, 0, 0, 0, 0],
        9: [0, 6, 6, 6, 4, 0, 0, 0, 0, 0],
        10: [0, 6, 6, 6, 5, 3, 0, 0, 0, 0],
        11: [0, 6, 6, 6, 6, 4, 0, 0, 0, 0],
        12: [0, 6, 6, 6, 6, 5, 3, 0, 0, 0],
        13: [0, 6, 6, 6, 6, 6, 4, 0, 0, 0],
        14: [0, 6, 6, 6, 6, 6, 5, 3, 0, 0],
        15: [0, 6, 6, 6, 6, 6, 6, 4, 0, 0],
        16: [0, 6, 6, 6, 6, 6, 6, 5, 3, 0],
        17: [0, 6, 6, 6, 6, 6, 6, 6, 4, 0],
        18: [0, 6, 6, 6, 6, 6, 6, 6, 5, 3],
        19: [0, 6, 6, 6, 6, 6, 6, 6, 6, 4],
        20: [0, 6, 6, 6, 6, 6, 6, 6, 6, 6],
      },
      'paladin': {
        1: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        8: [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        9: [0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        10: [0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        11: [0, 2, 1, 1, 0, 0, 0, 0, 0, 0],
        12: [0, 2, 2, 1, 0, 0, 0, 0, 0, 0],
        13: [0, 3, 2, 1, 0, 0, 0, 0, 0, 0],
        14: [0, 3, 2, 1, 1, 0, 0, 0, 0, 0],
        15: [0, 3, 2, 2, 1, 0, 0, 0, 0, 0],
        16: [0, 3, 3, 2, 1, 0, 0, 0, 0, 0],
        17: [0, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        18: [0, 4, 3, 2, 2, 0, 0, 0, 0, 0],
        19: [0, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        20: [0, 4, 4, 3, 3, 0, 0, 0, 0, 0],
      },
      'psychic': {
        1: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 4, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 5, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 6, 3, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 6, 4, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 6, 5, 3, 0, 0, 0, 0, 0, 0],
        7: [0, 6, 6, 4, 0, 0, 0, 0, 0, 0],
        8: [0, 6, 6, 5, 3, 0, 0, 0, 0, 0],
        9: [0, 6, 6, 6, 4, 0, 0, 0, 0, 0],
        10: [0, 6, 6, 6, 5, 3, 0, 0, 0, 0],
        11: [0, 6, 6, 6, 6, 4, 0, 0, 0, 0],
        12: [0, 6, 6, 6, 6, 5, 3, 0, 0, 0],
        13: [0, 6, 6, 6, 6, 6, 4, 0, 0, 0],
        14: [0, 6, 6, 6, 6, 6, 5, 3, 0, 0],
        15: [0, 6, 6, 6, 6, 6, 6, 4, 0, 0],
        16: [0, 6, 6, 6, 6, 6, 6, 5, 3, 0],
        17: [0, 6, 6, 6, 6, 6, 6, 6, 4, 0],
        18: [0, 6, 6, 6, 6, 6, 6, 6, 5, 3],
        19: [0, 6, 6, 6, 6, 6, 6, 6, 6, 4],
        20: [0, 6, 6, 6, 6, 6, 6, 6, 6, 6],
      },
      'ranger': {
        1: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        8: [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
        9: [0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        10: [0, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        11: [0, 2, 1, 1, 0, 0, 0, 0, 0, 0],
        12: [0, 2, 2, 1, 0, 0, 0, 0, 0, 0],
        13: [0, 3, 2, 1, 0, 0, 0, 0, 0, 0],
        14: [0, 3, 2, 1, 1, 0, 0, 0, 0, 0],
        15: [0, 3, 2, 2, 1, 0, 0, 0, 0, 0],
        16: [0, 3, 3, 2, 1, 0, 0, 0, 0, 0],
        17: [0, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        18: [0, 4, 3, 2, 2, 0, 0, 0, 0, 0],
        19: [0, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        20: [0, 4, 4, 3, 3, 0, 0, 0, 0, 0],
      },
      'shaman': {
        1: [3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 3, 2, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 3, 2, 1, 0, 0, 0, 0, 0, 0],
        6: [4, 3, 3, 2, 0, 0, 0, 0, 0, 0],
        7: [4, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        8: [4, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        9: [4, 4, 4, 3, 2, 1, 0, 0, 0, 0],
        10: [4, 4, 4, 3, 3, 2, 0, 0, 0, 0],
        11: [4, 4, 4, 4, 3, 2, 1, 0, 0, 0],
        12: [4, 4, 4, 4, 3, 3, 2, 0, 0, 0],
        13: [4, 4, 4, 4, 4, 3, 2, 1, 0, 0],
        14: [4, 4, 4, 4, 4, 3, 3, 2, 0, 0],
        15: [4, 4, 4, 4, 4, 4, 3, 2, 1, 0],
        16: [4, 4, 4, 4, 4, 4, 3, 3, 2, 0],
        17: [4, 4, 4, 4, 4, 4, 4, 3, 2, 1],
        18: [4, 4, 4, 4, 4, 4, 4, 3, 3, 2],
        19: [4, 4, 4, 4, 4, 4, 4, 4, 3, 3],
        20: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
      },
      'sorcerer': {
        1: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 4, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 5, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 6, 3, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 6, 4, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 6, 5, 3, 0, 0, 0, 0, 0, 0],
        7: [0, 6, 6, 4, 0, 0, 0, 0, 0, 0],
        8: [0, 6, 6, 5, 3, 0, 0, 0, 0, 0],
        9: [0, 6, 6, 6, 4, 0, 0, 0, 0, 0],
        10: [0, 6, 6, 6, 5, 3, 0, 0, 0, 0],
        11: [0, 6, 6, 6, 6, 4, 0, 0, 0, 0],
        12: [0, 6, 6, 6, 6, 5, 3, 0, 0, 0],
        13: [0, 6, 6, 6, 6, 6, 4, 0, 0, 0],
        14: [0, 6, 6, 6, 6, 6, 5, 3, 0, 0],
        15: [0, 6, 6, 6, 6, 6, 6, 4, 0, 0],
        16: [0, 6, 6, 6, 6, 6, 6, 5, 3, 0],
        17: [0, 6, 6, 6, 6, 6, 6, 6, 4, 0],
        18: [0, 6, 6, 6, 6, 6, 6, 6, 5, 3],
        19: [0, 6, 6, 6, 6, 6, 6, 6, 6, 4],
        20: [0, 6, 6, 6, 6, 6, 6, 6, 6, 6],
      },
      'spiritualist': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'summoner': {
        1: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [0, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [0, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [0, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [0, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [0, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [0, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [0, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [0, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [0, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [0, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [0, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [0, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [0, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [0, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [0, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [0, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [0, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [0, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'warpriest': {
        1: [3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 3, 0, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 3, 1, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 4, 2, 0, 0, 0, 0, 0, 0, 0],
        6: [5, 4, 3, 0, 0, 0, 0, 0, 0, 0],
        7: [5, 4, 3, 1, 0, 0, 0, 0, 0, 0],
        8: [5, 4, 4, 2, 0, 0, 0, 0, 0, 0],
        9: [5, 5, 4, 3, 0, 0, 0, 0, 0, 0],
        10: [5, 5, 4, 3, 1, 0, 0, 0, 0, 0],
        11: [5, 5, 4, 4, 2, 0, 0, 0, 0, 0],
        12: [5, 5, 5, 4, 3, 0, 0, 0, 0, 0],
        13: [5, 5, 5, 4, 3, 1, 0, 0, 0, 0],
        14: [5, 5, 5, 4, 4, 2, 0, 0, 0, 0],
        15: [5, 5, 5, 5, 4, 3, 0, 0, 0, 0],
        16: [5, 5, 5, 5, 4, 3, 1, 0, 0, 0],
        17: [5, 5, 5, 5, 4, 4, 2, 0, 0, 0],
        18: [5, 5, 5, 5, 5, 4, 3, 0, 0, 0],
        19: [5, 5, 5, 5, 5, 5, 4, 0, 0, 0],
        20: [5, 5, 5, 5, 5, 5, 5, 0, 0, 0],
      },
      'witch': {
        1: [3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 3, 2, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 3, 2, 1, 0, 0, 0, 0, 0, 0],
        6: [4, 3, 3, 2, 0, 0, 0, 0, 0, 0],
        7: [4, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        8: [4, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        9: [4, 4, 4, 3, 2, 1, 0, 0, 0, 0],
        10: [4, 4, 4, 3, 3, 2, 0, 0, 0, 0],
        11: [4, 4, 4, 4, 3, 2, 1, 0, 0, 0],
        12: [4, 4, 4, 4, 3, 3, 2, 0, 0, 0],
        13: [4, 4, 4, 4, 4, 3, 2, 1, 0, 0],
        14: [4, 4, 4, 4, 4, 3, 3, 2, 0, 0],
        15: [4, 4, 4, 4, 4, 4, 3, 2, 1, 0],
        16: [4, 4, 4, 4, 4, 4, 3, 3, 2, 0],
        17: [4, 4, 4, 4, 4, 4, 4, 3, 2, 1],
        18: [4, 4, 4, 4, 4, 4, 4, 3, 3, 2],
        19: [4, 4, 4, 4, 4, 4, 4, 4, 3, 3],
        20: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
      },
      'wizard': {
        1: [3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        2: [4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
        3: [4, 2, 1, 0, 0, 0, 0, 0, 0, 0],
        4: [4, 3, 2, 0, 0, 0, 0, 0, 0, 0],
        5: [4, 3, 2, 1, 0, 0, 0, 0, 0, 0],
        6: [4, 3, 3, 2, 0, 0, 0, 0, 0, 0],
        7: [4, 4, 3, 2, 1, 0, 0, 0, 0, 0],
        8: [4, 4, 3, 3, 2, 0, 0, 0, 0, 0],
        9: [4, 4, 4, 3, 2, 1, 0, 0, 0, 0],
        10: [4, 4, 4, 3, 3, 2, 0, 0, 0, 0],
        11: [4, 4, 4, 4, 3, 2, 1, 0, 0, 0],
        12: [4, 4, 4, 4, 3, 3, 2, 0, 0, 0],
        13: [4, 4, 4, 4, 4, 3, 2, 1, 0, 0],
        14: [4, 4, 4, 4, 4, 3, 3, 2, 0, 0],
        15: [4, 4, 4, 4, 4, 4, 3, 2, 1, 0],
        16: [4, 4, 4, 4, 4, 4, 3, 3, 2, 0],
        17: [4, 4, 4, 4, 4, 4, 4, 3, 2, 1],
        18: [4, 4, 4, 4, 4, 4, 4, 3, 3, 2],
        19: [4, 4, 4, 4, 4, 4, 4, 4, 3, 3],
        20: [4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
      },
    };
    return spellPerDay;
  }
}
