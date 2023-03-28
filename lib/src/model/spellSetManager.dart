import 'package:code/src/model/spell.dart';
import 'package:code/src/model/spell_set.dart';

class SpellSetManager {
  static List<SpellSet> _sortByLevel(SpellSet fullSet) {
    List<SpellSet> setsPerLevel = [];

    Map<int, List<Spell>> spellsByLevel = {};
    fullSet.spells.forEach((spell) {
      spell.level.values.forEach((level) {
        spellsByLevel.putIfAbsent(level, () => []).add(spell);
      });
    });

    spellsByLevel.forEach((level, spells) {
      setsPerLevel.add(SpellSet("Level $level", spells: spells));
    });

    return setsPerLevel;
  }
}
