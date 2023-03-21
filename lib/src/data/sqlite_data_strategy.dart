import 'package:code/src/model/character_class.dart';
import 'interface/i_data_strategy.dart';
import '../model/spell.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;
import 'dart:io' as io;
import 'spell_serializer.dart';

class SQLiteDataStrategy implements IDataStrategy {
  static final SQLiteDataStrategy _instance = SQLiteDataStrategy._internal();
  late final Database _db;

  factory SQLiteDataStrategy() {
    return _instance;
  }

  SQLiteDataStrategy._internal() {
    final dbPath = p.join(io.Directory.current.path, 'assets', 'spells.db');
    _db = sqlite3.open(dbPath);
    print("oh");
  }

  // Future<void> _init() async {
  //   final dbPath =
  //       p.join(await io.Directory.current.path, 'assets', 'spells.db');

  //   _instance = SQLiteDataStrategy._();
  //   _instance!._db = sqlite3.open(dbPath);
  // }

  // static Future<SQLiteDataStrategy> getInstance() async {
  //   if (_instance == null) {
  //     _instance = SQLiteDataStrategy._();
  //     await _instance?._init();
  //   }
  //   return _instance!;
  // }

  @override
  Future<List<Spell>> loadSpells() async {
    var list = _db.select(
        'SELECT id, name, level, school, casting_time, components, range, target, area, effect, duration, saving_throw, spell_resistance, description FROM spell WHERE name is not null and school is not null');
    //'SELECT id, name, level, school, casting_time, components, range, target, area, effect, duration, saving_throw, spell_resistance, description FROM spell WHERE id = 2038');
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

      var tmpLevel = (list[i]['level'] != null && list[i]['level'] != Null)
          ? SpellSerializer.parseLevelAndGetClass(list[i]['level'])
          : <CharacterClass, int>{};

      var tmpSchool;
      (list[i]['school'] != null && list[i]['school'] != Null)
          ? tmpSchool = list[i]['school']
          : tmpSchool = '';

      var tmpCastingTime;
      (list[i]['casting_time'] != null && list[i]['casting_time'] != Null)
          ? tmpCastingTime = list[i]['casting_time']
          : tmpCastingTime = '';

      var tmpComponent;
      (list[i]['components'] != null && list[i]['components'] != Null)
          ? tmpComponent = list[i]['components']
          : tmpComponent = '';

      var tmpRange;
      (list[i]['range'] != null && list[i]['range'] != Null)
          ? tmpRange = list[i]['range']
          : tmpRange = '';

      var tmpTarget;
      (list[i]['target'] != null && list[i]['target'] != Null)
          ? tmpTarget = list[i]['target']
          : tmpTarget = '';

      var tmpArea;
      print(list[i]['area']);
      (list[i]['area'] != null && list[i]['area'] != Null)
          ? tmpArea = list[i]['area']
          : tmpArea = '';

      var tmpEffect;
      (list[i]['effect'] != null && list[i]['effect'] != Null)
          ? tmpEffect = list[i]['effect']
          : tmpEffect = '';

      var tmpDuration;
      (list[i]['duration'] != null && list[i]['duration'] != Null)
          ? tmpDuration = list[i]['duration']
          : tmpDuration = '';

      var tmpSavingThrow;
      (list[i]['saving_throw'] != null && list[i]['saving_throw'] != Null)
          ? tmpSavingThrow = list[i]['saving_throw']
          : tmpSavingThrow = '';

      var tmpSepllResistance;
      (list[i]['spell_resistance'] != null &&
              list[i]['spell_resistance'] != Null)
          ? tmpSepllResistance = list[i]['spell_resistance']
          : tmpSepllResistance = '';

      var tmpDescription;
      (list[i]['description'] != null && list[i]['description'] != Null)
          ? tmpDescription = list[i]['description']
          : tmpDescription = '';

      spells.add(Spell(
          tmpId,
          tmpName,
          tmpLevel,
          tmpSchool,
          tmpCastingTime,
          tmpComponent,
          tmpRange,
          tmpTarget,
          tmpArea,
          tmpEffect,
          tmpDuration,
          tmpSavingThrow,
          tmpSepllResistance,
          tmpDescription));
    }
    return spells;
  }

  @override
  Future<Spell> getSpellById(int id) async {
    var db = _db;

    var list = db.select(
        'SELECT id, name, level, school, casting_time, components, range, target, area, effect, duration, saving_throw, spell_resistance, description FROM spell WHERE name is not null and school is not null and id=$id');

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

    var tmpLevel = (element['level'] != null && element['level'] != Null)
        ? SpellSerializer.parseLevelAndGetClass(element['level'])
        : <CharacterClass, int>{};

    var tmpSchool;
    (element['school'] != null && element['school'] != Null)
        ? tmpSchool = element['school']
        : tmpSchool = '';

    var tmpCastingTime;
    (element['casting_time'] != null && element['casting_time'] != Null)
        ? tmpCastingTime = element['casting_time']
        : tmpCastingTime = '';

    var tmpComponent;
    (element['components'] != null && element['components'] != Null)
        ? tmpComponent = element['components']
        : tmpComponent = '';

    var tmpRange;
    (element['range'] != null && element['range'] != Null)
        ? tmpRange = element['range']
        : tmpRange = '';

    var tmpTarget;
    (element['target'] != null && element['target'] != Null)
        ? tmpTarget = element['target']
        : tmpTarget = '';

    var tmpArea;
    (element['area'] != null && element['area'] != Null)
        ? tmpArea = element['area']
        : tmpArea = '';

    var tmpEffect;
    (element['effect'] != null && element['effect'] != Null)
        ? tmpEffect = element['effect']
        : tmpEffect = '';

    var tmpDuration;
    (element['duration'] != null && element['duration'] != Null)
        ? tmpDuration = element['duration']
        : tmpDuration = '';

    var tmpSavingThrow;
    (element['saving_throw'] != null && element['saving_throw'] != Null)
        ? tmpSavingThrow = element['saving_throw']
        : tmpSavingThrow = '';

    var tmpSepllResistance;
    (element['spell_resistance'] != null && element['spell_resistance'] != Null)
        ? tmpSepllResistance = element['spell_resistance']
        : tmpSepllResistance = '';

    var tmpDescription;
    (element['description'] != null && element['description'] != Null)
        ? tmpDescription = element['description']
        : tmpDescription = '';

    return Spell(
        tmpId,
        tmpName,
        tmpLevel,
        tmpSchool,
        tmpCastingTime,
        tmpComponent,
        tmpRange,
        tmpTarget,
        tmpArea,
        tmpEffect,
        tmpDuration,
        tmpSavingThrow,
        tmpSepllResistance,
        tmpDescription);
  }
}
