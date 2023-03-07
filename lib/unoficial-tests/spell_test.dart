import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/json_account_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';

import '../src/data/interface/i_account_strategy.dart';
import '../src/model/character.dart';
import '../src/model/spell.dart';

void main(List<String> args) async {
  IAccountStrategy strat = JsonAccountStrategy();

  List<Character> list = await strat.loadChar();

  for (var char in list) {
    print(char.toString());
  }

  // JsonAccountStrategy j = JsonAccountStrategy();
  // List<Character> l = [
  //   Character("champ 1 ", "Bar", 1),
  //   Character("champ 2 ", "Pal", 2),
  //   Character("champ 3 ", "Cle", 4)
  // ];
  // print("a");
  // l[0].addSet(SpellSet('set1'));
  // print("b");
  // l[0].sets[0].spells.add(Spell(
  //     0,
  //     '_name',
  //     '_description',
  //     '_reference',
  //     '_source',
  //     '_school',
  //     {},
  //     '_castingTime',
  //     [],
  //     '_range',
  //     '_target',
  //     '_duration'));
  // l[0].sets[0].spells.add(Spell(
  //     54,
  //     '_name',
  //     '_description',
  //     '_reference',
  //     '_source',
  //     '_school',
  //     {},
  //     '_castingTime',
  //     [],
  //     '_range',
  //     '_target',
  //     '_duration'));
  // l[0].sets[0].spells.add(Spell(
  //     2,
  //     '_name',
  //     '_description',
  //     '_reference',
  //     '_source',
  //     '_school',
  //     {},
  //     '_castingTime',
  //     [],
  //     '_range',
  //     '_target',
  //     '_duration'));
  // print("C");

  // l[0].knownSpells.add(Spell(
  //     0,
  //     '_name',
  //     '_description',
  //     '_reference',
  //     '_source',
  //     '_school',
  //     {},
  //     '_castingTime',
  //     [],
  //     '_range',
  //     '_target',
  //     '_duration'));

  // j.saveChar(l);
}
