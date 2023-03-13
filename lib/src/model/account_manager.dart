import 'package:code/src/model/character.dart';

class AccountManager {
  static final AccountManager _acManager = AccountManager._internal();
  List<Character> _characters = <Character>[];

  factory AccountManager() {
    return _acManager;
  }

  AccountManager._internal();

  List<Character> get characters => _characters;
  set characters(List<Character> charcs) => _characters = charcs;

  // Methods
  void addCharacter(Character c) {
    _characters.add(c);
  }

  void removeCharacter(Character c) {
    _characters.remove(c);
  }
}
