import 'spell.dart';

class SpellSet {
  String _name;
  List<Spell> _spells;
  Map<int, bool> _isCheckedMap = {};
  int _level;

  // Constructor
  SpellSet(this._name, {List<Spell>? spells, int? level})
      : _spells = spells ?? [],
        _level = level ?? 1;

  // Getters and Setters
  String get name => _name;
  set name(String n) => _name = n;

  int get level => _level;
  set level(int value) => _level = value;

  List<Spell> get spells => _spells;
  set spells(List<Spell> l) => _spells = l;

  Map<int, bool> get isCheckedMap => _isCheckedMap;
  set isCheckedMap(Map<int, bool> map) => _isCheckedMap = map;

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
      copiedSpells.add(spell.copy());
    }
    return SpellSet("Copy Of $_name", spells: copiedSpells);
  }
}
