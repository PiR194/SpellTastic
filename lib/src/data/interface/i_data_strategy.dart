import '../../model/spell.dart';

abstract class IDataStrategy {
  Future<List<Spell>> loadSpells();
  Future<Spell> getSpellById(int id);
}
