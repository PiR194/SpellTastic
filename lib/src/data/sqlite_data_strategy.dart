import 'package:code/src/data/i_data_strategy.dart';
import 'package:code/src/models/spell.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class SQLiteDataStrategy implements IDataStrategy {
  static SQLiteDataStrategy? _instance;

  late final Database _db;

  SQLiteDataStrategy._() {
    _db = sqlite3
        .open(p.join(Directory.current.path, "assets/pathfinderfr-data.db"));
  }

  @override
  List<Spell> loadSpells() {
    var db = getInstance();

    List list = db._db.select(
        'SELECT name, school FROM SPELLS WHERE name is not null and school is not null');

    List<Spell> spells = [];
    for (int i = 0; i < list.length; i++) {
      var tempLevel = list[i]['levels'].split(',');
      Map<String, int> tempMap = Map();
      for (String element in tempLevel) {
        List<String> tmp = element.split(' ');
        //tempMap[tmp.first]=(int)tmp.last;
      }

      //spells.add(Spell(list[i]['id'], list[i]['name'], list[i]['description'],
      //  list[i]['reference'], list[i]['school'],Map<String,int>(tempLevel.split(' ').first, list[i]['castingtime']));
    }

    return spells;
  }

  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }
}
