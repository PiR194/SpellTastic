import 'package:test/test.dart';
import '../lib/src/model/spell.dart';

void main() {
  Spell mainSpell = Spell(
      1,
      "mainSpell",
      "mainDesc",
      "mainRef",
      "mainSource",
      "mainSchool",
      Map<String, int>(),
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
      Map<String, int>(),
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
      Map<String, int>(),
      "mainCastTime",
      List.empty(),
      "mainRange",
      "mainTarget",
      "mainDuration");

  test('both Spell should be equal', () {
    expect(copySpell.equals(mainSpell), true);
  });
}
