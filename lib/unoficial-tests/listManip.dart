import 'dart:io';
import 'package:code/classes/character.dart';
import 'package:code/classes/spellSet.dart';
import 'package:sqlite3/sqlite3.dart';
import '../classes/spell.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
    var spells = getAllSpells();
    print(spells.length);

    var set1 = SpellSet("set1");
    var set2 = SpellSet("set2");

    var charac = Character("myChar", "Wizard", 1);
    charac.sets.add(set1);
    

}



List<Spell> getAllSpells() {
    List<Spell> spells = [];

    // new connexion to database because path here differs
    Database db = sqlite3.open(p.join(Directory.current.path, "../../assets/pathfinderfr-data.db"));

    List list = db.select('SELECT name, school, description FROM SPELLS WHERE name is not null and school is not null');

    for(int i = 0; i < list.length; i++) {
        spells.add(Spell(list[i]['name'], list[i]['school'], list[i]['description']));
    }
    return spells;
}
