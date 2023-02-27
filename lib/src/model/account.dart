import 'package:code/src/model/character.dart';

class Account {
  List<Character> _characters;

  Account(this._characters);

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
