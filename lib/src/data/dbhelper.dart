import 'package:code/src/data/spell_serializer.dart';
import 'package:code/src/model/spell.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:io' show Platform;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../model/character_class.dart';

class DbHelper {
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

  Future<List<Spell>> getSpells() async {
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
      (list[i]['casting_time'] != null && list[i]['casting_time'] != Null)
          ? tmpCastingTime = list[i]['casting_time']
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
