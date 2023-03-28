import 'character_class.dart';
import 'spell_set.dart';

class Character {
  String _name;
  final CharacterClass _characterClass; // change into actual cclass Class
  int _level;
  List<SpellSet> _sets;
  SpellSet _knownSpells;

  Character(
    this._name,
    this._characterClass,
    this._level, {
    List<SpellSet>? sets,
    SpellSet? knownSpells,
  })  : _sets = sets ?? [],
        _knownSpells = knownSpells ?? SpellSet('Known Spells');

  // Getters and Setters
  String get name => _name;
  set name(String n) => _name = n;

  CharacterClass get characterClass => _characterClass;

  int get level => _level;
  set level(int l) => _level = l;

  List<SpellSet> get sets => _sets;
  set sets(List<SpellSet> l) => _sets = l;

  SpellSet get knownSpells => _knownSpells;
  set knownSpells(SpellSet known) => _knownSpells = known;

  // methods
  void addSet(SpellSet set) {
    sets.add(set);
  }

  void removeSet(SpellSet set) {
    sets.remove(set);
  }

  @override
  String toString() {
    String setsString = _sets.map((s) => s.toString()).join(', ');
    String knownSpellsString =
        _knownSpells.spells.map((s) => s.toString()).join(', ');
    return 'Character{_name: $_name, _cclass: $_characterClass, _level: $_level, _sets: [$setsString], _knownSpells: [$knownSpellsString]}';
  }
}
