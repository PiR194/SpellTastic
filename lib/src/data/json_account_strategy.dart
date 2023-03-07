import 'dart:convert';
import 'dart:io';
import 'package:code/src/data/interface/i_account_strategy.dart';
import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';
import 'package:code/src/model/character.dart';

import 'mapper/character_mapper.dart';

class JsonAccountStrategy implements IAccountStrategy {
  @override
  Future<List<Character>> loadChar() async {
    IDataStrategy dataStrategy = await SQLiteDataStrategy.getInstance();
    File file = File('assets/account.json');
    var jsonString = file.readAsStringSync();
    List<dynamic> decoded = jsonDecode(jsonString);
    List<Character> characters = [];

    for (var jsonElement in decoded) {
      characters.add(await CharacterMapper.fromJson(jsonElement, dataStrategy));
    }
    return characters;
  }

  @override
  void saveChar(List<Character> listChar) {
    File file = File('assets/account.json');
    List content = List.empty(growable: true);
    for (var char in listChar) {
      content.add(CharacterMapper.toJson(char));
    }
    file.writeAsStringSync(jsonEncode(content));
  }
}
