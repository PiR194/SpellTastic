import 'interface/i_data_strategy.dart';
import '../model/spell.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;
import 'dart:io' as io;

class SQLiteDataStrategy implements IDataStrategy {
  static SQLiteDataStrategy? _instance;

  late final Database _db;

  SQLiteDataStrategy._();

  Future<void> _init() async {
    final dbPath = p.join(
        await io.Directory.current.path, 'assets', 'pathfinderfr-data.db');

    _instance = SQLiteDataStrategy._();
    _instance!._db = sqlite3.open(dbPath);
  }

  static Future<SQLiteDataStrategy> getInstance() async {
    if (_instance == null) {
      _instance = SQLiteDataStrategy._();
      await _instance?._init();
    }
    return _instance!;
  }

  @override
  Future<List<Spell>> loadSpells() async {
    var db = await getInstance();

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

  @override
  Future<Spell> getSpellById(int id) async {
    var db = await getInstance();

    var list = db._db.select(
        'SELECT id, name, description, reference, source, school, level, castingtime, components, range, target, duration FROM SPELLS WHERE name is not null and school is not null and id=$id');

    if (list.isEmpty) {
      throw Exception('No Spell found with this id : $id');
    }

    var element = list.first;

    var tmpId;
    (element['id'] != null && element['id'] != Null)
        ? tmpId = element['id']
        : tmpId = '';

    var tmpName;
    (element['name'] != null && element['name'] != Null)
        ? tmpName = element['name']
        : tmpName = '';

    var tmpDescription;
    (element['description'] != null && element['description'] != Null)
        ? tmpDescription = element['description']
        : tmpDescription = '';

    var tmpReference;
    (element['reference'] != null && element['reference'] != Null)
        ? tmpReference = element['reference']
        : tmpReference = '';

    var tmpSource;
    (element['source'] != 'null' &&
            element['source'] != Null &&
            element['source'] != null)
        ? tmpSource = element['source']
        : tmpSource = '';

    var tmpSchool;
    (element['school'] != null && element['school'] != Null)
        ? tmpSchool = element['school']
        : tmpSchool = '';

    Map<String, int> tmpLevel = {};
    if (element['level'] != null && element['level'] != Null) {
      var l = element['level'].toString().split(',');
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
    (element['castingtime'] != null && element['castingtime'] != Null)
        ? tmpCastingTime = element['castingtime']
        : tmpCastingTime = '';

    var tmpComponent;
    (element['components'] != null && element['components'] != Null)
        ? tmpComponent = element['components'].toString().split(',')
        : tmpComponent = List<String>.empty();

    var tmpRange;
    (element['range'] != null && element['range'] != Null)
        ? tmpRange = element['range']
        : tmpRange = '';

    var tmpTarget;
    (element['target'] != null && element['target'] != Null)
        ? tmpTarget = element['target']
        : tmpTarget = '';

    var tmpDuration;
    (element['duration'] != null && element['duration'] != Null)
        ? tmpDuration = element['duration']
        : tmpDuration = '';

    return Spell(
        tmpId,
        tmpName,
        tmpDescription,
        tmpReference,
        tmpSource,
        tmpSchool,
        tmpLevel,
        tmpCastingTime,
        tmpComponent,
        tmpRange,
        tmpTarget,
        tmpDuration);
  }
}
