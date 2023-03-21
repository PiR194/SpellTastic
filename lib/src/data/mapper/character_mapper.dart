import 'package:code/src/data/mapper/spell_set_mapper.dart';
import 'package:code/src/model/character.dart';
import '../../model/character_class.dart';
import '../../model/spell.dart';
import '../../model/spell_set.dart';
import '../interface/i_data_strategy.dart';

class CharacterMapper {
  static Map<String, dynamic> toJson(Character char) {
    List jsonSets = [];
    char.sets.map((item) => jsonSets.add(SpellSetMapper.toJson(item))).toList();

    List jsonKnown = [];
    char.knownSpells.spells.map((spell) => jsonKnown.add(spell.id)).toList();

    Map<String, dynamic> map = {
      'name': char.name,
      'class': char.characterClass,
      'level': char.level,
      'sets': jsonSets,
      'knownSpells': jsonKnown
    };

    return map;
  }

  static Future<Character> fromJson(dynamic json, IDataStrategy data) async {
    List<SpellSet> listSet = [];
    SpellSet listSpell = SpellSet('Known Spells');

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
      listSpell.spells.add(spell);
    }

    CharacterClass characterClass = CharacterClass.values.firstWhere((e) =>
        e.toString().split('.').last == json['class'].toString().toLowerCase());

    return Character(json['name'], characterClass, json['level'],
        sets: listSet, knownSpells: listSpell);
  }
}
