import 'package:code/classes/spell.dart';
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
        'SELECT name, school, description FROM SPELLS WHERE name is not null and school is not null and description is not null');

    List<Spell> spells = [];
    for (int i = 0; i < list.length; i++) {
      spells.add(
          Spell(list[i]['name'], list[i]['school'], list[i]['description']));
    }

    return spells;
  }
}
