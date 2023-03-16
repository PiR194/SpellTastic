import 'spell.dart';

class SpellSet {
  String _name;
  List<Spell> _spells;

  // Constructor
  SpellSet(this._name, {List<Spell>? spells}) : _spells = spells ?? [];
  // Getters and Setters
  String get name => _name;
  set name(String n) => _name = n;

  List<Spell> get spells => _spells;
  set spells(List<Spell> l) => _spells = l;

  void addSpell(Spell spell) {
    spells.add(spell);
  }

  @override
  String toString() {
    String spellsString = _spells.map((s) => s.toString()).join(', ');
    return 'SpellSet{_name: $_name, _spells: [$spellsString]}';
  }

  SpellSet clone() {
    List<Spell> copiedSpells = [];
    for (Spell spell in spells) {
      copiedSpells.add(spell);
    }
    return SpellSet(_name, spells: copiedSpells);
  }
}
