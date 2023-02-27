import 'i_data_strategy.dart';
import '../model/spell.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;
import 'dart:io' as io;

class SQLiteDataStrategy implements IDataStrategy {
  static SQLiteDataStrategy? _instance;

  late final Database _db;

  SQLiteDataStrategy._();

  static Future<void> init() async {
    final dbPath = p.join(
        await io.Directory.current.path, 'assets', 'pathfinderfr-data.db');

    _instance = SQLiteDataStrategy._();
    _instance!._db = sqlite3.open(dbPath);
  }

  @override
  List<Spell> loadSpells() {
    var db = getInstance();

    var list = db._db.select(
        'SELECT id, name, description, reference, source, school, level, castingtime, components, range, target, duration FROM SPELLS WHERE name is not null and school is not null');

    List<Spell> spells = [];

    for (int i = 0; i < list.length; i++) {
      Map<String, int> tmpLevel = {};
      {
        var l = list[i]['level'].toString().split(',');
        for (var element in l) {
          if (element.startsWith(' ', 0)) {
            element = element.replaceFirst(' ', '');
          }
          var t = element.split(' ');
          if (t.last == '') {
            break;
          }
          tmpLevel[t.first] = int.parse(t.last);
          //print('Result : ' + tmpLevel[t.first].toString());
        }
      }

      var tmpCastingTime;
      (list[i]['castingtime'] != null)
          ? tmpCastingTime = list[i]['castingtime']
          : tmpCastingTime = '';

      var tmpTarget;
      (list[i]['target'] != null)
          ? tmpTarget = list[i]['target']
          : tmpTarget = '';

      var tmpComponent;
      (list[i]['components'] != null)
          ? tmpComponent = list[i]['components'].toString().split(',')
          : tmpComponent = List<String>.empty();

      spells.add(Spell(
          list[i]['id'],
          list[i]['name'],
          list[i]['description'],
          list[i]['reference'],
          list[i]['source'],
          list[i]['school'],
          tmpLevel,
          tmpCastingTime,
          tmpComponent, //list[i]['level'],
          0, //list[i]['range'],
          tmpTarget,
          0)); //list[i]['duration']));
    }

    return spells;
  }

  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }
}
