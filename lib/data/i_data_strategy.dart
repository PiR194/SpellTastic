import '../classes/spell.dart';

abstract class IDataStrategy {
  List<Spell> loadSpells();
}

