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
      var tmpId;
      (list[i]['id'] != null && list[i]['id'] != Null)
          ? tmpId = list[i]['id']
          : tmpId = '';

      var tmpName;
      (list[i]['name'] != null && list[i]['name'] != Null)
          ? tmpName = list[i]['name']
          : tmpName = '';

      var tmpDescription;
      (list[i]['description'] != null && list[i]['description'] != Null)
          ? tmpDescription = list[i]['description']
          : tmpDescription = '';

      var tmpReference;
      (list[i]['reference'] != null && list[i]['reference'] != Null)
          ? tmpReference = list[i]['reference']
          : tmpReference = '';

      var tmpSource;
      (list[i]['source'] != 'null' &&
              list[i]['source'] != Null &&
              list[i]['source'] != null)
          ? tmpSource = list[i]['source']
          : tmpSource = '';

      var tmpSchool;
      (list[i]['school'] != null && list[i]['school'] != Null)
          ? tmpSchool = list[i]['school']
          : tmpSchool = '';

      Map<String, int> tmpLevel = {};
      if (list[i]['level'] != null && list[i]['level'] != Null) {
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
      (list[i]['castingtime'] != null && list[i]['castingtime'] != Null)
          ? tmpCastingTime = list[i]['castingtime']
          : tmpCastingTime = '';

      var tmpComponent;
      (list[i]['components'] != null && list[i]['components'] != Null)
          ? tmpComponent = list[i]['components'].toString().split(',')
          : tmpComponent = List<String>.empty();

      var tmpRange;
      (list[i]['range'] != null && list[i]['range'] != Null)
          ? tmpRange = list[i]['range']
          : tmpRange = '';

      var tmpTarget;
      (list[i]['target'] != null && list[i]['target'] != Null)
          ? tmpTarget = list[i]['target']
          : tmpTarget = '';

      var tmpDuration;
      (list[i]['duration'] != null && list[i]['duration'] != Null)
          ? tmpDuration = list[i]['duration']
          : tmpDuration = '';

      spells.add(Spell(
          tmpId,
          tmpName,
          tmpDescription,
          tmpReference,
          tmpSource,
          tmpSchool,
          tmpLevel,
          tmpCastingTime,
          tmpComponent, //list[i]['level'],
          tmpRange, //list[i]['range'],
          tmpTarget,
          tmpDuration)); //list[i]['duration']));
    }

    return spells;
  }

  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }
}
