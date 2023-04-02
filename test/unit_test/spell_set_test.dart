@Skip('Not ready yet')
import 'package:code/src/model/spell.dart';
import 'package:code/src/model/spell_set.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Size of list should be 1 after adding a spell', () {
    var spellSet = SpellSet("myBestSpells");
    spellSet.addSpell(Spell(
        3,
        "name",
        Map(),
        "reference",
        "school",
        "castingTime",
        "components",
        "_range",
        "_target",
        "area",
        "effect",
        "duration",
        "savingThrow",
        "description"));

    expect(spellSet.spells.length, 1);
  });

  test('Spell should have same name', () {
    var spellSet = SpellSet("myBestSpells");
    spellSet.addSpell(Spell(
        3,
        "name",
        Map(),
        "reference",
        "school",
        "castingTime",
        "components",
        "_range",
        "_target",
        "area",
        "effect",
        "duration",
        "savingThrow",
        "description"));

    spellSet.spells[0] = Spell(
        3,
        "blop",
        Map(),
        "reference",
        "school",
        "castingTime",
        "components",
        "_range",
        "_target",
        "area",
        "effect",
        "duration",
        "savingThrow",
        "description");

    expect(spellSet.spells[0].name, "blop");
  });
}
