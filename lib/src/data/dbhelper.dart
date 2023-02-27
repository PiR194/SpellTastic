import 'package:code/src/model/spell.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:io' show Platform;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "pathfinderfr-data.db");
    bool dbExists = await io.File(path).exists();
    //bool dbExists = await databaseExists(path);

    if (!dbExists) {
      if (Platform.isAndroid) {
        ByteData data =
            await rootBundle.load(join("assets", "pathfinderfr-data.db"));
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
}
