import 'package:code/src/model/character.dart';

abstract class IAccountStrategy {
  Future<List<Character>> loadCharacters();
  void saveCharacters(List<Character> listChar);
}
