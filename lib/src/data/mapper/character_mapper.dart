import 'package:code/src/data/mapper/spell_set_mapper.dart';
import 'package:code/src/model/character.dart';
import '../../model/spell.dart';
import '../../model/spell_set.dart';
import '../interface/i_data_strategy.dart';

class CharacterMapper {
  static Map<String, dynamic> toJson(Character char) {
    List jsonSets = [];
    char.sets.map((item) => jsonSets.add(SpellSetMapper.toJson(item))).toList();

    List jsonKnown = [];
    char.knownSpells.map((spell) => jsonKnown.add(spell.id)).toList();

    Map<String, dynamic> map = {
      'name': char.name,
      'class': char.cclass,
      'level': char.level,
      'sets': jsonSets,
      'knownSpells': jsonKnown
    };

    return map;
  }

  static Future<Character> fromJson(dynamic json, IDataStrategy data) async {
    List<SpellSet> listSet = [];
    List<Spell> listSpell = [];

    for (var s in json['sets']) {
      String setName = s['name'];
      List<Spell> spells = [];
      for (var spellIndex in s['spells']) {
        Spell spell = await data.getSpellById(spellIndex);
        spells.add(spell);
      }
      SpellSet set = SpellSet(setName, spells: spells);
      listSet.add(set);
    }

    for (var spellIndex in json['knownSpells']) {
      Spell spell = await data.getSpellById(spellIndex);
      listSpell.add(spell);
    }

    return Character(json['name'], json['class'], json['level'],
        sets: listSet, knownSpells: listSpell);
  }
}
