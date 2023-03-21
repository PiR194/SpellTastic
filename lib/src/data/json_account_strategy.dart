import 'dart:convert';
import 'dart:io';
import 'package:code/src/data/dbhelper.dart';
import 'package:code/src/data/interface/i_account_strategy.dart';
import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';
import 'package:code/src/model/character.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'mapper/character_mapper.dart';
import 'package:flutter/services.dart' show rootBundle;

class JsonAccountStrategy implements IAccountStrategy {
  @override
  Future<List<Character>> loadCharacters() async {
    IDataStrategy dataStrategy;
    String jsonString = '';
    if (Platform.isAndroid) {
      dataStrategy = DbHelper();
      // jsonString = await rootBundle.loadString('assets/account.json');
      jsonString = await File(join(
              (await getApplicationDocumentsDirectory()).path, 'account.json'))
          .readAsString();
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
  Future<void> saveCharacters(List<Character> listChar) async {
    String jsonString = '';
    File file;
    if (Platform.isAndroid) {
      file = File(join(
          (await getApplicationDocumentsDirectory()).path, 'account.json'));
    } else {
      file = File('assets/account.json');
    }
    List content = List.empty(growable: true);
    for (var char in listChar) {
      content.add(CharacterMapper.toJson(char));
    }
    file.writeAsStringSync(jsonEncode(content));
  }
}
