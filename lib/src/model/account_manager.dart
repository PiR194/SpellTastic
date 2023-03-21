import 'package:code/src/model/character.dart';

import 'character_class.dart';

class AccountManager {
  static final AccountManager _acManager = AccountManager._internal();
  List<Character> _characters = <Character>[];
  Character selectedCharacter = Character("dummy", CharacterClass.wizard, 10);

  factory AccountManager() {
    return _acManager;
  }

  AccountManager._internal();

  List<Character> get characters => _characters;
  set characters(List<Character> charcs) => _characters = charcs;

  // Methods
  void addCharacter(Character character) {
    _characters.add(character);
  }

  void removeCharacter(Character character) {
    _characters.remove(character);
  }

  void selectCharacter(Character character) {
    selectedCharacter = character;
  }
}
