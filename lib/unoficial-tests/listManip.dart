/* 
The purpose of this file is to manually test Character and SpellSet classes.
*/

import 'dart:io';
import 'package:code/src/model/character_class.dart';

import '../src/model/character.dart';
import '../src/model/spell_set.dart';
import '../src/data/sqlite_data_strategy.dart';
import 'package:sqlite3/sqlite3.dart';
import '../src/model/spell.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  var spells = await getAllSpells();
  print(spells.length);

  var set1 = SpellSet("set1");
  var set2 = SpellSet("set2");

  set1.addSpell(spells[27]);
  set1.addSpell(spells[1220]);
  set1.addSpell(spells[130]);
  set1.addSpell(spells[468]);

  set2.addSpell(spells[14]);
  set2.addSpell(spells[1620]);
  set2.addSpell(spells[132]);
  set2.addSpell(spells[469]);

  var charac = Character("myChar", CharacterClass.wizard, 1);
  charac.addSet(set1);
  charac.addSet(set2);
}

Future<List<Spell>> getAllSpells() async {
  try {
    var data = await SQLiteDataStrategy();
    return await data.loadSpells();
  } on SqliteException catch (e) {
    print("Error loading spells: ${e.message}");
    print(
        "Nicolas: You need to execute this file from the root of the project");
    return [];
  }
}
