import 'dart:convert';
import 'dart:io';
import 'package:code/src/data/dbhelper.dart';
import 'package:code/src/data/interface/i_account_strategy.dart';
import 'package:code/src/data/interface/i_data_strategy.dart';
import 'package:code/src/data/mapper/spell_set_mapper.dart';
import 'package:code/src/data/sqlite_data_strategy.dart';
import 'package:code/src/model/character.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/spell_set.dart';
import 'mapper/character_mapper.dart';

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

  @override
  void saveFavorites(SpellSet favoriteSpells) async {
    File file;
    List content = List.empty(growable: true);

    if (Platform.isAndroid) {
      file = File(join(
          (await getApplicationDocumentsDirectory()).path, 'account.json'));
    } else {
      file = File('assets/account.json');
    }

    var jsonContent = jsonDecode(await file.readAsString());
    var favoriteSpellsJson = SpellSetMapper.toJson(favoriteSpells);

    if (jsonContent.isNotEmpty && jsonContent[0] is Map) {
      jsonContent[0]['favoriteSpells'] = favoriteSpellsJson;
    } else {
      jsonContent.insert(0, {'favoriteSpells': favoriteSpellsJson});
    }

    content = jsonContent;
    file.writeAsStringSync(jsonEncode(content));
  }

  @override
  Future<SpellSet> loadFavorites() async {
    String jsonString = '';
    IDataStrategy dataStrategy;

    if (Platform.isAndroid) {
      dataStrategy = DbHelper();
      jsonString = await File(join(
              (await getApplicationDocumentsDirectory()).path, 'account.json'))
          .readAsString();
    } else {
      dataStrategy = SQLiteDataStrategy();
      File file = File('assets/account.json');
      jsonString = file.readAsStringSync();
    }

    List<dynamic> decoded = jsonDecode(jsonString);
    SpellSet favoriteSpells = SpellSet('Favorite Spells');

    if (decoded.isNotEmpty && decoded[0] is Map) {
      var favoriteSpellsJson = decoded[0]['favoriteSpells'];
      if (favoriteSpellsJson != null) {
        favoriteSpells =
            await SpellSetMapper.fromJson(favoriteSpellsJson, dataStrategy);
      }
    }

    return favoriteSpells;
  }
}
