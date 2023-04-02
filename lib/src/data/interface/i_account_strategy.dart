import 'package:code/src/model/character.dart';

import '../../model/spell_set.dart';

abstract class IAccountStrategy {
  Future<List<Character>> loadCharacters();
  void saveCharacters(List<Character> listChar);
  Future<SpellSet> loadFavorites();
  void saveFavorites(SpellSet favoriteSpells);
}
