import '../src/model/spell.dart';

void main(List<String> args) async {
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

  print(copySpell.toString());
  print(mainSpell.toString());
  print(sideSpell.toString());
}
