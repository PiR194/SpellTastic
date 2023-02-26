import '../model/spell.dart';

abstract class IDataStrategy {
  List<Spell> loadSpells();
}
