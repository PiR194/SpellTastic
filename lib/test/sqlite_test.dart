import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:code/src/data/i_data_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';

void main() {
  IDataStrategy data = SQLiteDataStrategy.getInstance();

  var list = data.loadSpells();
}
