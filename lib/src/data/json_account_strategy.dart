import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as p;
import 'package:code/src/data/dbhelper.dart';
import 'package:path/path.dart';
import 'package:code/src/data/interface/i_account_strategy.dart';
import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';
import 'package:code/src/model/character.dart';
import 'mapper/character_mapper.dart';
import 'package:flutter/services.dart' show rootBundle;

class JsonAccountStrategy implements IAccountStrategy {
  @override
  Future<List<Character>> loadCharacters() async {
    IDataStrategy dataStrategy;
    String jsonString = '';
    if (Platform.isAndroid) {
      Directory documentsDirectory = await p.getApplicationDocumentsDirectory();
      dataStrategy = DbHelper();
      // print(Directory.current.path);
      // print(documentsDirectory);
      // path = join(documentsDirectory.path, "account.json");
      jsonString = await rootBundle.loadString('assets/account.json');
    } else {
      dataStrategy = SQLiteDataStrategy();
      File file = File('assets/account.json');
      if (!await file.exists()) return [];
      jsonString = file.readAsStringSync();
    }

    List<dynamic> decoded = jsonDecode(jsonString);
    List<Character> characters = [];

    for (var jsonElement in decoded) {
      characters.add(await CharacterMapper.fromJson(jsonElement, dataStrategy));
    }
    return characters;
  }

  @override
  void saveCharacters(List<Character> listChar) {
    File file = File('assets/account.json');
    List content = List.empty(growable: true);
    for (var char in listChar) {
      content.add(CharacterMapper.toJson(char));
    }
    file.writeAsStringSync(jsonEncode(content));
  }
}
