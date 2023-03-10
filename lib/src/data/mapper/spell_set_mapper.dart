import 'package:code/src/model/spell_set.dart';

class SpellSetMapper {
  static Map<String, dynamic> toJson(SpellSet set) {
    List jsonSpell = [];
    set.spells.map((e) => jsonSpell.add(e.id)).toList();
    Map<String, dynamic> map = {'name': set.name, 'spells': jsonSpell};
    return map;
  }
}
