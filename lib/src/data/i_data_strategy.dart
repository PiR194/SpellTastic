import '../models/spell.dart';

abstract class IDataStrategy {
  List<Spell> loadSpells();
}
