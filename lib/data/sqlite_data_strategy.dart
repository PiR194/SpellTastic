import 'package:code/./data/i_data_strategy.dart';
import '../classes/spell.dart';
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
            'SELECT name, school, description FROM SPELLS WHERE name is not null and school is not null');

    List<Spell> spells = [];
    for (int i = 0; i < list.length; i++) {
        spells.add(Spell(list[i]['name'], list[i]['school'], list[i]['description']));
    }

    return spells;
}

  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }
}

