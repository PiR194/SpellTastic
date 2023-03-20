import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  IDataStrategy dataStrategy = SQLiteDataStrategy();
  test('get first spell', () async {
    var champ = await dataStrategy.getSpellById(1);
    expect("Abeyance", champ.name);
  });
}
