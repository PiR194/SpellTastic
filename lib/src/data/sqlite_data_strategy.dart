import 'i_data_strategy.dart';
import '../models/spell.dart';
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

    var list = db._db.select(
        'SELECT id, name, description, reference, source, school, level, castingtime, components, range, target, duration FROM SPELLS WHERE name is not null and school is not null');

    List<Spell> spells = [];
    for (int i = 0; i < list.length; i++) {
      spells.add(Spell(
          list[i]['id'],
          list[i]['name'],
          list[i]['description'],
          list[i]['reference'],
          null, //list[i]['source'],
          null, //list[i]['components'],
          list[i]['school'],
          null, //list[i]['level'],
          list[i]['castingtime'],
          null, //list[i]['range'],
          list[i]['target'],
          null)); //list[i]['duration']));
    }

    return spells;
  }

  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }
}
