import 'dart:io';

import 'package:code/src/data/dbhelper.dart';
import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  IDataStrategy dataStrategy;
  if (Platform.isAndroid) {
    dataStrategy = DbHelper();
  } else {
    dataStrategy = await SQLiteDataStrategy();
  }

  test('get first spell', () {
    var champ = dataStrategy.getSpellById(1);
  });
}
