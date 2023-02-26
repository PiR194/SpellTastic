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

      spells.add(Spell(
          list[i]['id'],
          list[i]['name'],
          list[i]['description'],
          list[i]['reference'],
          list[i]['source'],
          list[i]['school'],
          tmpLevel,
          tmpCastingTime,
          List<String>.empty(), //list[i]['level'],
          0, //list[i]['range'],
          tmpTarget,
          0)); //list[i]['duration']));
    }

    return spells;
  }
}
