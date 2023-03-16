import 'package:code/src/model/character.dart';
import 'package:code/src/model/character_class.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:code/src/model/spell.dart';

void main() {
  group('Equal', () {
    test('both Spell should be equal', () {
      Spell mainSpell = Spell(
          1,
          "mainSpell",
          <CharacterClass, int>{},
          "mainSchool",
          "mainCastTime",
          "mainComp",
          "mainRange",
          "mainTarget",
          "mainArea",
          "mainEffect",
          "mainDuration",
          "mainSavingThrow",
          "mainSpellResistance",
          "mainDesc");

      Spell copySpell = Spell(
          1,
          "mainSpell",
          <CharacterClass, int>{},
          "mainSchool",
          "mainCastTime",
          "mainComp",
          "mainRange",
          "mainTarget",
          "mainArea",
          "mainEffect",
          "mainDuration",
          "mainSavingThrow",
          "mainSpellResistance",
          "mainDesc");

      expect(copySpell.equals(mainSpell), true);
    });

    test('both Spell should not be equal', () {
      Spell sideSpell = Spell(
          2,
          "sideSpell",
          <CharacterClass, int>{},
          "sideSchool",
          "sideCastTime",
          "sideComp",
          "sideRange",
          "sideTarget",
          "sideArea",
          "sideEffect",
          "sideDuration",
          "sideSavingThrow",
          "sideSpellResistance",
          "sideDesc");

      Spell mainSpell = Spell(
          1,
          "mainSpell",
          <CharacterClass, int>{},
          "mainSchool",
          "mainCastTime",
          "mainComp",
          "mainRange",
          "mainTarget",
          "mainArea",
          "mainEffect",
          "mainDuration",
          "mainSavingThrow",
          "mainSpellResistance",
          "mainDesc");

      expect(sideSpell.equals(mainSpell), false);
    });
  });

  test('Constructor and Getter', () {
    Spell mainSpell = Spell(
        1,
        "mainSpell",
        <CharacterClass, int>{},
        "mainSchool",
        "mainCastTime",
        "mainComp",
        "mainRange",
        "mainTarget",
        "mainArea",
        "mainEffect",
        "mainDuration",
        "mainSavingThrow",
        "mainSpellResistance",
        "mainDesc");
    expect(mainSpell.id, 1);
    expect(mainSpell.name, "mainSpell");
    expect(mainSpell.GetMapClassLevel(), {});
    expect(mainSpell.school, "mainSchool");
    expect(mainSpell.castingTime, "mainCastTime");
    expect(mainSpell.components, "mainComp");
    expect(mainSpell.range, "mainRange");
    expect(mainSpell.target, "mainTarget");
    expect(mainSpell.area, "mainArea");
    expect(mainSpell.effect, "mainEffect");
    expect(mainSpell.duration, "mainDuration");
    expect(mainSpell.savingThrow, "mainSavingThrow");
    expect(mainSpell.spellResistance, "mainSpellResistance");
    expect(mainSpell.description, "mainDesc");
  });

  test('Setter', () {
    Spell spell = Spell(
        1,
        "mainSpell",
        <CharacterClass, int>{},
        "mainSchool",
        "mainCastTime",
        "mainComp",
        "mainRange",
        "mainTarget",
        "mainArea",
        "mainEffect",
        "mainDuration",
        "mainSavingThrow",
        "mainSpellResistance",
        "mainDesc");

    spell.name = "BUT";
    expect(spell.name, equals("BUT"));

    spell.school = "IUT";
    expect(spell.school, equals("IUT"));

    spell.castingTime = "3years";
    expect(spell.castingTime, equals("3years"));

    spell.components = "bdd,poo";
    expect(spell.components, equals("bdd,poo"));

    spell.range = "Cezeaux";
    expect(spell.range, equals("Cezeaux"));

    spell.target = "etudiants";
    expect(spell.target, "etudiants");

    spell.area = "Clermont";
    expect(spell.area, "Clermont");

    spell.effect = "Savoir";
    expect(spell.effect, "Savoir");

    spell.duration = "life";
    expect(spell.duration, "life");

    spell.savingThrow = "idk";
    expect(spell.savingThrow, "idk");

    spell.spellResistance = "teach";
    expect(spell.spellResistance, "teach");

    spell.description = "a diploma";
    expect(spell.description, "a diploma");
  });
}
