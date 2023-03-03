import 'package:test/test.dart';
import 'package:code/src/model/spell.dart';

void main() {
  Spell mainSpell = Spell(
      1,
      "mainSpell",
      "mainDesc",
      "mainRef",
      "mainSource",
      "mainSchool",
      <String, int>{},
      "mainCastTime",
      List.empty(),
      "mainRange",
      "mainTarget",
      "mainDuration");
  Spell sideSpell = Spell(
      2,
      "sideSpell",
      "sideDesc",
      "sideRef",
      "sideSource",
      "sideSchool",
      <String, int>{},
      "sideCastTime",
      List.empty(),
      "sideRange",
      "sideTarget",
      "sideDuration");
  Spell copySpell = Spell(
      1,
      "mainSpell",
      "mainDesc",
      "mainRef",
      "mainSource",
      "mainSchool",
      <String, int>{},
      "mainCastTime",
      List.empty(),
      "mainRange",
      "mainTarget",
      "mainDuration");
  group('Equal', () {
    test('both Spell should be equal', () {
      expect(copySpell.equals(mainSpell), true);
    });

    test('both Spell should not be equal', () {
      expect(sideSpell.equals(mainSpell), false);
    });
  });

  group('toString', () {
    test('mainSpell.toString', () {
      expect(
          mainSpell.toString(),
          equals(
              'id: 1\nname: mainSpell\ndescription: mainDesc\nreference: mainRef\nsource: mainSource\nschool: mainSchool\nlevel: {}\ncasting time: mainCastTime\ncomponents: []\nrange: mainRange\ntarget: mainTarget\nduration: mainDuration\n'));
    });
    test('sideSpell.toString', () {
      expect(
          sideSpell.toString(),
          equals(
              'id: 2\nname: sideSpell\ndescription: sideDesc\nreference: sideRef\nsource: sideSource\nschool: sideSchool\nlevel: {}\ncasting time: sideCastTime\ncomponents: []\nrange: sideRange\ntarget: sideTarget\nduration: sideDuration\n'));
    });
    test('copySpell.toString', () {
      expect(
          copySpell.toString(),
          equals(
              'id: 1\nname: mainSpell\ndescription: mainDesc\nreference: mainRef\nsource: mainSource\nschool: mainSchool\nlevel: {}\ncasting time: mainCastTime\ncomponents: []\nrange: mainRange\ntarget: mainTarget\nduration: mainDuration\n'));
    });
  });

  group('Constructor and Getter', () {
    final spell = Spell(
        1,
        "Fireball",
        "A bright streak flashes from your pointing finger to a point you choose within range then blossoms with a low roar into an explosion of flame.",
        "PHB",
        "Wizard spell list",
        "Evocation",
        {"Wizard": 3, "Sorcerer": 3},
        "1 action",
        ["V", "S", "M (a tiny ball of bat guano and sulfur)"],
        "150 feet",
        "20-foot-radius sphere",
        "Instantaneous");

    test('Name', () {
      expect(spell.name, equals("Fireball"));
    });
    test('Description', () {
      expect(
          spell.description,
          equals(
              "A bright streak flashes from your pointing finger to a point you choose within range then blossoms with a low roar into an explosion of flame."));
    });
    test('Source', () {
      expect(spell.source, equals("Wizard spell list"));
    });
    test('School', () {
      expect(spell.school, equals("Evocation"));
    });
    test('Level', () {
      expect(spell.level, equals({"Wizard": 3, "Sorcerer": 3}));
    });
    test('Component', () {
      expect(spell.components,
          equals(["V", "S", "M (a tiny ball of bat guano and sulfur)"]));
    });
    test('Casting Time', () {
      expect(spell.castingTime, equals("1 action"));
    });
    test('Range', () {
      expect(spell.range, equals("150 feet"));
    });
    test('Target', () {
      expect(spell.target, equals("20-foot-radius sphere"));
    });
    test('Duration', () {
      expect(spell.duration, equals("Instantaneous"));
    });
  });

  group('Setter', () {
    final spell = Spell(
        1,
        "Cure Wounds",
        "A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier. This spell has no effect on undead or constructs.",
        "PHB",
        "Cleric spell list",
        "Evocation",
        {"Cleric": 1},
        "1 action",
        ["V", "S"],
        "Touch",
        "1 creature",
        "Instantaneous");

    spell.name = "a";
    test('Name', () {
      expect(spell.name, equals("a"));
    });

    spell.description = "a";
    test('Descritpion', () {
      expect(spell.description, equals("a"));
    });
    spell.description = "a";
    test('Reference', () {
      expect(spell.reference, equals("PHB"));
    });
    spell.description = "a";
    test('Source', () {
      expect(spell.source, equals("Cleric spell list"));
    });
    spell.description = "a";
    test('School', () {
      expect(spell.school, equals("Evocation"));
    });
    spell.description = "a";
    test('Level', () {
      expect(spell.level, equals({"Cleric": 1}));
    });
    spell.castingTime = "a";
    test('CastingTime', () {
      expect(spell.castingTime, equals("a"));
    });
    spell.components = ["a"];
    test('Component', () {
      expect(spell.components, equals(["a"]));
    });
    spell.range = "a";
    test('Range', () {
      expect(spell.range, equals("a"));
    });
    spell.target = "a";
    test('Target', () {
      expect(spell.target, equals("a"));
    });
    spell.duration = "a";
    test('Duration', () {
      expect(spell.duration, equals("a"));
    });
  });
}
