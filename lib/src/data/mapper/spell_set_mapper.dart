import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/model/spell_set.dart';

import '../../model/spell.dart';

class SpellSetMapper {
  static Map<String, dynamic> toJson(SpellSet set) {
    List jsonSpell = [];
    set.spells.map((e) => jsonSpell.add(e.id)).toList();
    Map<String, dynamic> map = {'name': set.name, 'spells': jsonSpell};
    return map;
  }

  static Future<SpellSet> fromJson(
      favoriteSpellsJson, IDataStrategy data) async {
    String name = favoriteSpellsJson['name'];
    List<int> spellIds =
        favoriteSpellsJson['spells'].map<int>((id) => id as int).toList();
    List<Spell> spells = [];
    for (var spellIndex in spellIds) {
      Spell spell = await data.getSpellById(spellIndex);
      spells.add(spell);
    }
    return SpellSet(name, spells: spells);
  }
}
