import 'package:code/./data/i_data_strategy.dart';
import '../classes/spell.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'dart:io' show Platform;

class SQLiteDataStrategy implements IDataStrategy {
  static SQLiteDataStrategy? _instance;

  late final Database _db;

  SQLiteDataStrategy._();

  static Future<void> init() async {
      final dbPath = p.join(await io.Directory.current.path, 'assets', 'pathfinderfr-data.db');
    /*} else if (Platform.isAndroid || Platform.isWindows) {
      final appDirectory = await getApplicationSupportDirectory();
      dbPath = p.join(appDirectory.path, 'pathfinderfr-data.db');
    }*/

    _instance = SQLiteDataStrategy._();
    _instance!._db = sqlite3.open(dbPath);
  }

  @override
  List<Spell> loadSpells() {
    late final Database db;
    db = getInstance()._db;

    List list = db.select(
        'SELECT name, school, description FROM SPELLS WHERE name is not null and school is not null');

    List<Spell> spells = [];
    for (int i = 0; i < list.length; i++) {
      spells.add(Spell(list[i]['name'], list[i]['school'], list[i]['description']));
    }

    return spells;
  }

  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }

  void dispose() {
    //
  }
}