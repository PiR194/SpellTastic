import 'package:code/src/model/character.dart';

abstract class IAccountStrategy {
  Future<List<Character>> loadChar();
  void saveChar(List<Character> listChar);
}
