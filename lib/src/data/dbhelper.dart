import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/spell_serializer.dart';
import 'package:code/src/model/character_class.dart';
import 'package:code/src/model/spell.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:io' show Platform;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbHelper implements IDataStrategy {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "spells.db");
    bool dbExists = await io.File(path).exists();
    //bool dbExists = await databaseExists(path);

    if (!dbExists) {
      if (Platform.isAndroid) {
        ByteData data = await rootBundle.load(join("assets", "spells.db"));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await io.File(path).writeAsBytes(bytes, flush: true);
      } else if (Platform.isWindows) {
        var databaseFactory = databaseFactoryFfi;
        _db = await databaseFactory.openDatabase(inMemoryDatabasePath);
        return _db;
      }
    }

    var theDb = await openDatabase(path, version: 1);
    return theDb;
  }

  @override
  Future<Spell> getSpellById(int id) async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery(
        'SELECT id, name, description, reference, source, school, level, castingtime, components, range, target, duration FROM spell WHERE name is not null and school is not null and id=$id');

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

  @override
  Future<List<Spell>> loadSpells() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery(
        'SELECT id, name, level, school, casting_time, components, range, target, area, effect, duration, saving_throw, spell_resistance, description FROM spell WHERE name is not null and school is not null');

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

      var tmpArea;
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
}
