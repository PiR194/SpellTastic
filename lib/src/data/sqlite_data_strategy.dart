import 'package:code/src/data/i_data_strategy.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class SQLiteDataStrategy implements IDataStrategy {
  static SQLiteDataStrategy? _instance;

  late final Database _db;

  SQLiteDataStrategy._() {
    _db =
        sqlite3.open(p.join(Directory.current.path, "lib/src/data/spells.db"));
  }

  @override
  List loadSpells() {
    // TODO: implement loadSpells
    throw UnimplementedError();
  }

  @override
  static SQLiteDataStrategy getInstance() {
    _instance ??= SQLiteDataStrategy._();
    return _instance!;
  }
}
