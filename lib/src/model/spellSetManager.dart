import 'package:code/src/model/spell.dart';
import 'package:code/src/model/spell_set.dart';

import 'character_class.dart';

class SpellSetManager {
  static List<SpellSet> sortByLevel(
      SpellSet fullSet, CharacterClass charClass) {
    List<SpellSet> setsPerLevel = [];

    Map<int, List<Spell>> spellsByLevel = {};
    fullSet.spells.forEach((spell) {
      int? level = spell.level[charClass];
      if (level != null) {
        if (spellsByLevel[level]?.contains(spell) != true) {
          spellsByLevel.putIfAbsent(level, () => []).add(spell);
        }
      }
    });

    spellsByLevel.forEach((level, spells) {
      setsPerLevel.add(SpellSet("Level $level", spells: spells));
    });

    return setsPerLevel;
  }
}
