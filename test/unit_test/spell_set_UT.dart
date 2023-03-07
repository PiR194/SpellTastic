import 'package:code/src/model/spell.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Size of list should be 1 after adding a spell', () {
    var spellSet = SpellSet("myBestSpells");
    spellSet.addSpell(Spell(
        3,
        "name",
        "description",
        "reference",
        "source",
        "school",
        Map(),
        "castingTime",
        List.empty(),
        "_range",
        "_target",
        "_duration"));

    expect(spellSet.spells.length, 1);
  });

  test('Spell should have same name', () {
    var spellSet = SpellSet("myBestSpells");
    spellSet.addSpell(Spell(
        3,
        "name",
        "description",
        "reference",
        "source",
        "school",
        Map(),
        "castingTime",
        List.empty(),
        "_range",
        "_target",
        "_duration"));

    spellSet.spells[0] = Spell(
        3,
        "blop",
        "description",
        "reference",
        "source",
        "school",
        Map(),
        "castingTime",
        List.empty(),
        "_range",
        "_target",
        "_duration");

    expect(spellSet.spells[0].name, "blop");
  });
}
